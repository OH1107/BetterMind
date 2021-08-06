import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userInfo: [],
    programlist: [],
    program: {},
    postlist: [],
    post: {},
    isLogin: false,
    questions: [],
    answers : [],
    lastQuestion: [],
  },
  mutations: {
    //프로그램 관련
    GET_PROGRAMS: function (state, programlist) {
      state.programlist = programlist
    },
    // 프로그램 디테일
    GET_PROGRAM: function (state, program) {
      state.program = program
    },
    // 커뮤니티 관련
    GET_POSTS: function (state, postlist) {
      state.postlist = postlist
    },
    // 커뮤니티 디테일
    GET_POST: function (state, post) {
      state.post = post
    },
    
    // 로그인 상태
    ON_LOGIN: function (state) {
      state.isLogin = true
    },
    // 로그아웃 상태
    ON_LOGOUT: function (state) {
      state.isLogin = false
    },
    // 사용자 정보
    GET_MY_INFO: function (state, info) {
      state.userInfo = info
    },
    // 포스트잇 질문
    GET_QUESTIONS: function (state, questions) {
      state.questions = questions
      state.lastQuestion = questions[questions.length - 1]
    },
    // 포스트잇 답변
    GET_ANSWER: function (state, answers) {
      state.answers = answers
    }
  },
  actions: {
    // 프로그램 리스트
    getPrograms: function ({ commit }) {
      axios({
        method: 'get',
        url: '/api/v1/program/all',
      })
      .then(res => {
        commit('GET_PROGRAMS', res.data)
      })
      .catch(err => {
        console.log(err)
      })
    },
    // 프로그램 디테일
    getProgram: function ({ commit }, program_pk) {
      axios({
        method: 'get',
        url: `/api/v1/program/${program_pk}`,
      })
      .then(res => {
        commit('GET_PROGRAM', res.data)
      })
      .catch(err => {
        console.log(err)
      })
    },
    // 커뮤니티 리스트
    getPosts: function ({ commit }) {
      axios({
        method: 'get',
        url: '/api/v1/article/all',
        headers: {
          Authorization: `Bearer ${localStorage.getItem('jwt')}`
        },
      })
      .then(res => {
        commit('GET_POSTS', res.data)
      })
      .catch(err => {
        console.log(err)
      })
    },
    // 커뮤니티 디테일
    getPost: function ({ commit }, post_pk ) {
      axios({
        method: 'get',
        url: `/api/v1/article/${post_pk}`,
        headers: {
          Authorization: `Bearer ${localStorage.getItem('jwt')}`
        }
      })
      .then(res => {
        commit('GET_POST', res.data)
      })
    },
    // 내 정보 받아오기
    getMyInfo: function ({ commit }) {
      axios({
        method: 'get',
        url: '/api/v1/users/me',
        headers: {
          Authorization: `Bearer ${localStorage.getItem('jwt')}`
        }
      })
      .then(res => {
        commit('GET_MY_INFO', res.data)
      })
      .catch(err => {
        console.log(err)
      })
    },
    // 포스트잇 질문 리스트 받아오기
    getQuestions: function ({ commit }) {
      axios({
        method: 'get',
        url: `/api/v1/postit/all`
      })
      .then(res => {
        commit('GET_QUESTIONS', res.data)
      })
    },
    // 포스트잇 답변 리스트 받아오기
    getAnswer: function ({ commit }, questionId) {
      axios({
        method: 'get',
        url: `/api/v1/postit/${questionId}`
      })
      .then(res => {
        console.log(res.data)
        commit('GET_ANSWER', res.data)
      })
    }
  },
  modules: {
  }
})
