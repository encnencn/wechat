//app.js
var bsurl = require('utils/bsurl.js');
App({
  onLaunch: function () {
    
    if (!wx.cloud) {
      console.error('请使用 2.2.3 或以上的基础库以使用云能力')
    } else {
      wx.cloud.init({
        traceUser: true,
      })
    }
    wx.setStorageSync('hasLogin', false),
     
    this.globalData = {}
  },
 
 
  globalData: {
    hasLogin: false,
    hide: false,
    list_am: [],
    cookie: "",
    userInfo: {}
  },

  getUserInfo: function (cb) {
    var that = this
    if (this.globalData.userInfo) {
      typeof cb == "function" && cb(this.globalData.userInfo)
    } else {
      //调用登录接口
      this.mine();
      typeof cb == "function" && cb(this.globalData.userInfo)
    }
  },
 
})
