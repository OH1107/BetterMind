import Vue from 'vue'
import VueRouter from 'vue-router'
import Intro from '../views/Intro.vue'
import Main from '../views/Main.vue'
import Signup from '../views/Signup.vue'
import Login from '../views/Login.vue'
import PubActivities from '../views/mypage/PubActivities.vue'
import PubMeetings from '../views/mypage/PubMeetings.vue'
import ExpMeetings from '../views/mypage/ExpMeetings.vue'
import ExpAddMeeting from '../views/mypage/ExpAddMeeting.vue'
import UpdateUserInfo from '../views/mypage/UpdateUserInfo.vue'
import ProgramItems from '../views/programs/ProgramItems.vue'
import ProgramDetail from '../views/programs/ProgramDetail.vue'
import PersonalMeeting from '../views/programs/PersonalMeeting.vue'
import SelfGroupMeeting from '../views/programs/SelfGroupMeeting.vue'
import UpdateProgram from '../views/programs/UpdateProgram.vue'
import PostItems from '../views/community/PostItems.vue'
import PostDetail from '../views/community/PostDetail.vue'
import CreatePost from '../views/community/CreatePost.vue'
import UpdatePost from '../views/community/UpdatePost.vue'
import Payment from '../views/Payment.vue'
import WebRTC from '../views/webrtc/WebRTC.vue'
import Postit from '../views/Postit.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Intro',
    component: Intro
  },
  {
    path: '/main',
    name: 'Main',
    component: Main
  },
  {
    path: '/signup',
    name: 'Signup',
    component: Signup
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/mypage/pubactivities',
    name: 'PubActivities',
    component: PubActivities
  },
  {
    path: '/mypage/pubmeetings',
    name: 'PubMeetings',
    component: PubMeetings
  },
  {
    path: '/mypage/expmeetings',
    name: 'ExpMeetings',
    component: ExpMeetings
  },
  {
    path: '/mypage/expaddmeeting',
    name: 'ExpAddMeeting',
    component: ExpAddMeeting
  },
  {
    path: '/mypage/updateuserinfo',
    name: 'UpdateUserInfo',
    component: UpdateUserInfo
  },
  {
    path: '/programs',
    name: 'ProgramItems',
    component: ProgramItems
  },
  {
    path: '/programs/personal',
    name: 'PersonalMeeting',
    component: PersonalMeeting
  },
  {
    path: '/programs/self-help',
    name: 'SelfGroupMeeting',
    component: SelfGroupMeeting
  },
  {
    // pk????????? ????????????
    path: '/programs/:program_pk',
    name: 'ProgramDetail',
    component: ProgramDetail,
    props: true,
  },
  {
    // pk????????? ????????????
    path: '/programs/update/:program_pk',
    name: 'UpdateProgram',
    component: UpdateProgram,
    props: true,
  },
  {
    path: '/community',
    name: 'PostItems',
    component: PostItems
  },
  {
    // pk????????? ????????????
    path: '/community/:post_pk',
    name: 'PostDetail',
    component: PostDetail,
    props: true,
  },
  {
    path: '/community/create',
    name: 'CreatePost',
    component: CreatePost
  },
  {
    // pk????????? ????????????
    path: '/community/update/:post_pk',
    name: 'UpdatePost',
    component: UpdatePost,
    props: true,
  },
  {
    // pk????????? ????????????
    path: '/payment/:program_pk',
    name: 'Payment',
    component: Payment,
    props: true,
  },
  {
    // WebRTC
    path: '/webrtc',
    name: 'WebRTC',
    component: WebRTC,
    props: true,
  },
  {
    // path ?????? ?????? ?????????????????? ?????? ??????
    path: '/postit',
    name: 'Postit',
    component: Postit
  }
  
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
