// pages/audit/audit.js
const API = require('../../utils/request')
Page({

  /**
   * 页面的初始数据
   */
  data: {
    auditList: null,
  },



  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

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
    API.getUnAudit().then(res => {
      const req = JSON.parse(res)
      const that = this
      console.log(req);
      
      that.setData({
        auditList: req.data
      })
    })
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
  audit(e){
    const share = e.currentTarget.dataset.item
    wx.navigateTo({
      url: '../../pages/auditDetail/auditDetail?share='+JSON.stringify(share),
    })
  },
  goDetail(e) {
    // 取出绑定对象
    console.log(e)
    var share = e.currentTarget.dataset.item
    wx.navigateTo({
        url: '../shareDetail/shareDetail?share=' + JSON.stringify(share),
    })
},
})