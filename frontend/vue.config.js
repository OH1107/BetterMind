
// Vue3 관련 설정 파일
module.exports = {
  devServer: {
    disableHostCheck: true,
    https: true,
    port: 8083,
    open: true,
    proxy: {
      '/api/v1': {
        target: 'https://localhost:8443/'
      }
    },
    historyApiFallback: true,
    hot: true
  },

  lintOnSave: false,
  outputDir: '../backend/src/main/resources/dist',

  transpileDependencies: [
    'vuetify'
  ]
}
