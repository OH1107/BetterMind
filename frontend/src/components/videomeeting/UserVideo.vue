<template>
<div v-if="streamManager">
	<ov-video :stream-manager="streamManager" :class="{startSpeaking: hasSpeaker, stopSpeaking: !hasSpeaker}"/>
	<div><p class="text-subtitle-2 text-center fonr-weight-black">{{ clientData }}</p></div>
</div>
</template>

<script>
import OvVideo from './OvVideo';

export default {
	name: 'UserVideo',

	components: {
		OvVideo,
	},

	props: {
		streamManager: Object,
	},


	methods: {
    getConnectionData () {
      console.log("UV 스트림매니저 데이터", this.streamManager)
      const { connection } = this.streamManager.stream;
			return JSON.parse(connection.data);
		},
	},

  computed: {
    clientData () {
      const { clientData } = this.getConnectionData();
      return clientData;
    },
    // isSpeaking () {
    //   return this.$store.state.isSpeaking
    // },
    // 이 UV에 있는 사람이 발언중인가?
    hasSpeaker () {
      const { clientData } = this.getConnectionData()
      if (this.$store.state.speakers.includes(clientData)) {
        return true
      } else {
        return false
      }
    }
  },

};
</script>
<style>
  .startSpeaking {
    border-style: solid;
    border-width: 2px;
    border-color: #4FC3F7;
    border-radius: 0.3em;
  }
  .stopSpeaking {
    border-style: solid;
    border-width: 2px;
    border-color: transparent;
    border-radius: 0.3em;
  }
</style>
