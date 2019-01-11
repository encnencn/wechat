var bsurl = require('../../utils/bsurl.js');
var md5 = require('../../utils/base64md5.js');
var app = getApp();
Page({
  data: {
    phone: "",
    pwd: "",
    linktype: 1,
    url: ''
  },
  onLoad: function (options) {
    //登录成功后跳转类型(1,2,3) navgitorback , redirect ,switchTab
    console.log("options.t:" + options.t);
    this.setData({
      linktype: options.t || 3,
      url: options.url || '../home/index'
    })

  },
  textinput: function (event) {
    var type = event.currentTarget.dataset.type;
    if (type == 1) {
      this.setData({
        phone: event.detail.value
      })
    } else {
      this.setData({
        pwd: event.detail.value
      })
    }
  },
  login: function () {
    var that = this;
    if (!/^0\d{2,3}\d{7,8}$|^1[34578]\d{9}$/.test(that.data.phone)){
      wx.showModal({
        title: '提示',
        content: '账号不合法！'
      })
      return false;
    }
    var url =  "wx/login"
    wx.showToast({
      title: '登录中...',
      icon: 'loading'
    })
    wx.request({
      url: bsurl + url,
      method: "POST",
      data: {
        username: that.data.phone,
        password: md5.hexMD5(that.data.pwd)//
      },
      complete: function (res) {
       
        wx.hideToast();
        if (res.data.code != 200) {
          wx.showModal({
            title: '提示',
            content: '登录失败，请重试！'
          })
          return;
        }
      
        app.globalData.userInfo = res.data.userInfo;
        wx.setStorageSync('userInfo', res.data.userInfo);
        wx.setStorageSync('hasLogin', true);

        
        if (that.data.linktype == 1) {
          wx.switchTab({
            url: '../tabBar/workTable/workTable'
          });
        }
        else if (that.data.linktype == 2) {
          wx.switchTab({
            url: '../tabBar/message/message'
          });
        } else {
          wx.switchTab({
            url: '../tabBar/mine/mine'
          });
        }
         

      }
    })
  }
})