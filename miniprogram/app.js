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
      url: bsurl + 'wx/mine',
      method: "POST",
      success: function (res) {
        if(res.data.code!=200){
          wx.navigateTo({
            url: 'pages/login/login?t=3'
          })
        }
        that.globalData.userInfo = res.data.userInfo;
        wx.setStorageSync('userInfo', res.data.userInfo);
        wx.setStorageSync('hasLogin', true);
      }
    })
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
