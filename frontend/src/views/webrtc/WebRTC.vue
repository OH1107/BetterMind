<template>
  <div id="main-container" class="container">
    <v-btn @click="moveBack()" icon x-large v-if="!session">
      <v-icon>mdi-arrow-left-thick</v-icon>
    </v-btn>
    <div id="join" v-if="!session">
      <div id="join-dialog" class="jumbotron vertical-center">
        <h1 class="d-flex justify-center text-h1 font-weight-medium">
          미팅 참여
        </h1>
        <h1 class="d-flex justify-center text-h2 font-weight-medium program-name">
          {{ programName }}
        </h1>
        <div class="form-group">
          <v-text-field
            label="Nickname"
            hide-details="auto"
            v-model="myUserName"
            type="text"
            required
            class="nickname"
          ></v-text-field>
          <div class="text-center">
            <v-btn class="start-btn" block elevation="2" large @click="joinSession()">
              미팅 시작!
            </v-btn>
          </div>
        </div>
      </div>
    </div>

    <div id="session" v-if="session">
      <!-- <v-container> -->
      <v-row no-gutters>
        <v-col id="video-container" cols="11">
            <!-- 세션 참여자 모두를 보여줌 -->
            <!-- <div id="video-container" class="col-md-6"> -->
              <UserVideo
                id="pub-video"
                :stream-manager="publisher"
                @click.native="updateMainVideoStreamManager(publisher)"
                class="user-video col-3"
              />
              <UserVideo
                id="sub-video"
                v-for="sub in subscribers"
                :key="sub.stream.connection.connectionId"
                :stream-manager="sub"
                @click.native="updateMainVideoStreamManager(sub)"
                class="user-video col-3"
              />
        </v-col>
        <v-col cols="1">
          <UserChat id="user-chat" :chatLog="chatLog" @sendMessage="sendMessage" />
        </v-col>
      </v-row>
      <div id="session-header">
        <!-- <h1 id="session-title">{{ mySessionId }}</h1> -->
        <div class="d-flex justify-center align-center">
          <BottomBar
            :publisher="publisher"
            @leaveSession="leaveSession"
            @onFilter="onFilter"
            @offFilter="offFilter"
          />
        </div>
      </div>

      <!-- <v-row no-gutters>
          <BottomBar :publisher="publisher" @onFilter="onFilter" @offFilter="offFilter"/>
        </v-row> -->
      <!-- </v-container> -->
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { OpenVidu } from "openvidu-browser";
import UserVideo from "@/components/videomeeting/UserVideo";
import BottomBar from "@/components/videomeeting/BottomBar";
import UserChat from "@/components/videomeeting/UserChat";

axios.defaults.headers.post["Content-Type"] = "application/json";

// const OPENVIDU_SERVER_URL = "https://" + location.hostname + ":4443";
// 한건 로컬 주소
// const OPENVIDU_SERVER_URL = "https://192.168.0.11:4443";
// EC2 public ipV4
const OPENVIDU_SERVER_URL = "https://i5b208.p.ssafy.io:8444";
const OPENVIDU_SERVER_SECRET = "MY_SECRET";

export default {
  name: "WebRTC.vue",

  props: {
    programName: {
      type: String,
      default: "No Name",
      // required: true
    },
    programId: {
      type: Number,
      default: 1,
      // required: true,
    },
  },

  components: {
    UserVideo,
    UserChat,
    BottomBar,
  },

  data() {
    return {
      OV: undefined,
      session: undefined,
      mainStreamManager: undefined,
      publisher: undefined,
      subscribers: [],

      mySessionId: "SessionA",
      myUserName: "",

      myUserId: "",
      // chat
      chatLog: [],
    };
  },

  methods: {
    joinSession() {
      // --- Get an OpenVidu object ---
      this.OV = new OpenVidu();

      // --- Init a session ---
      this.session = this.OV.initSession();

      // --- Specify the actions when events take place in the session ---
      console.log("joinSession 후후후", this.mySessionId);

      // On every new Stream received...
      this.session.on("streamCreated", ({ stream }) => {
        const subscriber = this.session.subscribe(stream);
        this.subscribers.push(subscriber);
      });

      // On every Stream destroyed...
      this.session.on("streamDestroyed", ({ stream }) => {
        const index = this.subscribers.indexOf(stream.streamManager, 0);
        if (index >= 0) {
          this.subscribers.splice(index, 1);
        }
      });

      // On every asynchronous exception...
      this.session.on("exception", ({ exception }) => {
        console.warn(exception);
      });

      // Chat 수신
      this.session.on("signal", (event) => {
        this.chatLog.push([event.data, JSON.parse(event.from.data)]);
      });

      // Speech Detection 근데 이게 publisher만 된다는데 여러 유저랑 확인해서 해봐야 할 듯 한데
      this.session.on("publisherStartSpeaking", (event) => {
        console.log(event);
        console.log("User " + event.connection.data + " start speaking");
        // this.$store.dispatch('startSpeaking')
        this.$store.dispatch(
          "addSpeaker",
          JSON.parse(event.connection.data).clientData
        );
      });

      // Speech Stop Detection
      this.session.on("publisherStopSpeaking", (event) => {
        console.log("User " + event.connection.connectionId + " stop speaking");
        // this.$store.dispatch('stopSpeaking')
        this.$store.dispatch(
          "removeSpeaker",
          JSON.parse(event.connection.data).clientData
        );
      });

      // --- Connect to the session with a valid user token ---

      // 'getToken' method is simulating what your server-side should do.
      // 'token' parameter should be retrieved and returned by your own backend
      this.getToken(this.mySessionId).then((token) => {
        this.session
          .connect(token, { clientData: this.myUserName })
          .then(() => {
            // --- Get your own camera stream with the desired properties ---
            console.log("got a token!!!", token);
            console.log("세션상태확인", this.session);
            let publisher = this.OV.initPublisher(undefined, {
              audioSource: undefined, // The source of audio. If undefined default microphone
              videoSource: undefined, // The source of video. If undefined default webcam
              publishAudio: true, // Whether you want to start publishing with your audio unmuted or not
              publishVideo: true, // Whether you want to start publishing with your video enabled or not
              resolution: "640x480", // The resolution of your video
              frameRate: 30, // The frame rate of your video
              insertMode: "APPEND", // How the video is inserted in the target element 'video-container'
              mirror: true, // Whether to mirror your local video or not
            });

            this.mainStreamManager = publisher;
            this.publisher = publisher;

            // --- Publish your stream ---
            this.session.publish(this.publisher);
          })
          .catch((error) => {
            console.log(
              "There was an error connecting to the session:",
              error.code,
              error.message
            );
          });
      });
      window.addEventListener("beforeunload", this.leaveSession);
    },

    leaveSession() {
      // --- Leave the session by calling 'disconnect' method over the Session object ---
      if (this.session) this.session.disconnect();

      this.session = undefined;
      this.mainStreamManager = undefined;
      this.publisher = undefined;
      this.subscribers = [];
      this.OV = undefined;

      window.removeEventListener("beforeunload", this.leaveSession);
    },

    updateMainVideoStreamManager(stream) {
      console.log("비디오 클릭", this.publisher);
      if (this.mainStreamManager === stream) return;
      this.mainStreamManager = stream;
      console.log("bye");
    },

    // filter 적용 test Ubuntu 18.04 Version FaceOverlayFilter 사용 불가
    onFilter() {
      this.publisher.stream.applyFilter("GStreamerFilter", { "command": "textoverlay text='" + this.myUserId + "' valignment=top halignment=right font-desc='Cantarell 25'" })
      // this.publisher.stream
      //   .applyFilter("GStreamerFilter", {
      //     command:
      //       "gdkpixbufoverlay location=/tmp/santa-hat-transparent-11549385190r3okqt8gir.png offset-x=10 offset-y=10 overlay-height=50 overlay-width=50",
      //   })
        // EC2 안에 있는 hat 파일 이름 다름 주의
        // this.publisher.stream.applyFilter("GStreamerFilter", { "command": "gdkpixbufoverlay location=/tmp/santa-hat-transparent-11549385190r3okqt8gir.png offset-x=10 offset-y=10 overlay-height=50 overlay-width=50" })
        .then(() => {
          console.log("Video filltered!");
        })
        .catch((error) => {
          console.error(error);
        });
    },

    // filter off
    offFilter() {
      this.publisher.stream
        .removeFilter()
        .then(() => {
          console.log("Filter removed");
        })
        .catch((err) => {
          console.error(err);
        });
    },

    // chat message 발신
    sendMessage(msg) {
      this.session
        .signal({
          data: msg, // Any string (optional)
          to: [], // Array of Connection objects (optional. Broadcast to everyone if empty)
        })
        .then(() => {
          console.log("Message successfully sent");
        })
        .catch((error) => {
          console.error(error);
        });
    },

    /**
     * --------------------------
     * SERVER-SIDE RESPONSIBILITY
     * --------------------------
     * These methods retrieve the mandatory user token from OpenVidu Server.
     * This behavior MUST BE IN YOUR SERVER-SIDE IN PRODUCTION (by using
     * the API REST, openvidu-java-client or openvidu-node-client):
     *   1) Initialize a Session in OpenVidu Server	(POST /openvidu/api/sessions)
     *   2) Create a Connection in OpenVidu Server (POST /openvidu/api/sessions/<SESSION_ID>/connection)
     *   3) The Connection.token must be consumed in Session.connect() method
     */

    getToken(mySessionId) {
      return this.createSession(mySessionId).then((sessionId) =>
        this.createToken(sessionId)
      );
    },

    // See https://docs.openvidu.io/en/stable/reference-docs/REST-API/#post-openviduapisessions
    createSession(sessionId) {
      return new Promise((resolve, reject) => {
        axios
          .post(
            `${OPENVIDU_SERVER_URL}/openvidu/api/sessions`,
            JSON.stringify({
              customSessionId: sessionId,
            }),
            {
              auth: {
                username: "OPENVIDUAPP",
                password: OPENVIDU_SERVER_SECRET,
              },
            }
          )
          .then((response) => response.data)
          .then((data) => resolve(data.id))
          .catch((error) => {
            if (error.response.status === 409) {
              resolve(sessionId);
            } else {
              console.warn(
                `No connection to OpenVidu Server. This may be a certificate error at ${OPENVIDU_SERVER_URL}`
              );
              if (
                window.confirm(
                  `No connection to OpenVidu Server. This may be a certificate error at ${OPENVIDU_SERVER_URL}\n\nClick OK to navigate and accept it. If no certificate warning is shown, then check that your OpenVidu Server is up and running at "${OPENVIDU_SERVER_URL}"`
                )
              ) {
                location.assign(`${OPENVIDU_SERVER_URL}/accept-certificate`);
              }
              reject(error.response);
            }
          });
      });
    },

    // See https://docs.openvidu.io/en/stable/reference-docs/REST-API/#post-openviduapisessionsltsession_idgtconnection
    createToken(sessionId) {
      return new Promise((resolve, reject) => {
        axios
          .post(
            `${OPENVIDU_SERVER_URL}/openvidu/api/sessions/${sessionId}/connection`,
            {
              // filter 사용하기 위해 JSON에 kurentoOptions를 날린다.
              kurentoOptions: {
                allowedFilters: ["GStreamerFilter", "FaceOverlayFilter"],
              },
            },
            {
              auth: {
                username: "OPENVIDUAPP",
                password: OPENVIDU_SERVER_SECRET,
              },
            }
          )
          // res.data 확인하는곳
          .then((response) => response.data)
          .then((data) => resolve(data.token))
          .catch((error) => reject(error.response));
      });
    },
    //뒤로 가기
    moveBack: function() {
      this.$router.push({ name: "Main" });
    },
  },
  created: function() {
    this.mySessionId = this.programId.toString();
    this.myUserId = this.$store.state.userInfo.userid
  },
  // destroyed: function () {
  //   leaveSession()
  // }
};
</script>
<style scoped>
#session {
  display: block;
  justify-content: center;
	align-items: center;
	justify-content: center;
  margin-right: 10%;
}
#join {
	height: 70vh;
	overflow: hidden;
	display: flex;
  justify-content: center;
	align-items: center;
	justify-content: center;
}
.program-name {
  margin-top: 1.5rem;
}
.nickname {
  margin-top: 2rem;
}
.start-btn{
  margin-top: 3rem;
}
.backbtn {
  text-decoration-line: line-through;
  background-color: none;
}
#video-container {
  border-style: solid;
  border-width: 5px;
  border-color: #FFCDD2;
  border-radius: 2em;
  padding: 0.7%;
}
#pub-video {
  display: inline-block;
}
#sub-video {
  display: inline-block;
}
#user-chat {
  margin-left: 1rem;
}
#session-header {
  display: flex;
  justify-content: center;
	align-items: center;
	justify-content: center;
}
/* .user-video {
  margin: 2rem;
} */
</style>
