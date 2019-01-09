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
  mine: function () {
    var that = this;
    wx.request({
      url: bsurl + 'mine_xcx',
      success: function (res) {
        that.globalData.user = res.data;
        wx.setStorageSync('user', res.data);
        wx.setStorageSync('hasLogin', true);
      }
    })
  },
 
  globalData: {
    hasLogin: false,
    hide: false,
    list_am: [],
    cookie: "",
    user: {}
  }
})
