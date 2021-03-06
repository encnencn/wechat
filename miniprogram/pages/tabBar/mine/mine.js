// pages/tabBar/mine/mine.js
var bsurl = require('../../../utils/bsurl.js');
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
     if (wx.getStorageSync('hasLogin') == false) {
       wx.navigateTo({
         url: '../../login/login?t=3'
       })
     }else{
       var that = this
       //调用应用实例的方法获取全局数据
       app.getUserInfo(function (userInfo) {
         //更新数据
         that.setData({
           userInfo: userInfo
         })
         
       })
     }
  
   
  
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    if (wx.getStorageSync('hasLogin') == true) {
     
      var that = this
      //调用应用实例的方法获取全局数据
      app.getUserInfo(function (userInfo) {
        //更新数据
        that.setData({
          userInfo: userInfo
        })
      })
    }
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  /**
   * 绑定注销按钮
   */
  bindOffTap:function(){
    var that = this
    wx.showModal({
      title: '注销',
      content: '是否确认注销登录？',
      success(res) {
        if (res.confirm) {
          
          wx.request({
            url: bsurl + 'wx/logout',
            method: "POST",
            data:{
              token: app.globalData.userInfo.token
            },
            success: function (res) {
              if (res.data.code == 200) {
                app.globalData.userInfo = null;
                wx.clearStorageSync()
                that.setData({
                  userInfo: null
                })
                //that.onLoad();
                app.onLaunch();
                //  wx.navigateTo({
                //    url: '../mine/mine'
                //  })

               
              }
             
            }
          })

        } else if (res.cancel) {
          
        }
      }
    })
  },
})