const API_BASE_URL = 'http://localhost:8040';
const app = getApp()


const get = (url, data) => { 
  let _url = API_BASE_URL  + url;
  return new Promise((resolve, reject) => {
    wx.showLoading({
      title: "正在加载中...",
    })
    wx.request({
      url: _url,
      method: "get",
      data: data,
      header: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'X-Token': app.globalData.token
      },
      success(request) {
        wx.hideLoading();
        resolve(request.data)
      },
      fail(error) {
        reject(error)
      }
    })
  });
}
 const post = (url, data,contentType) => {
  let _url = API_BASE_URL  + url;
  switch(contentType){
    case "form" :
      var headerObj = {'content-type' : 'application/x-www-form-urlencoded'};
    break;
    case "json" : 
      var headerObj = {
        'X-Token': app.globalData.token,
        'content-type' : 'application/json'};
      // console.log(app.globalData.token);
    break;
    default :
      var headerObj = {'content-type' : 'application/json'};
  }
  return new Promise((resolve, reject) => {
    wx.request({
      url      : _url,
      data     : data,
      method   : "POST",
      dataType : JSON,
      header: headerObj,
      success(request) {  
        resolve(request.data)
      },
      fail(error) {
        reject(error)
      }
    })
  });
}
const put = (url, data,contentType) => {
  let _url = API_BASE_URL  + url;
  switch(contentType){
    case "form" :
      var headerObj = {'content-type' : 'application/x-www-form-urlencoded'};
    break;
    case "json" : 
      var headerObj = {'content-type' : 'application/json'};
    break;
    default :
      var headerObj = {'content-type' : 'application/json'};
  }
  return new Promise((resolve, reject) => {
    wx.request({
      url      : _url,
      data     : data,
      method   : "PUT",
      dataType : JSON,
      header: headerObj,
      success(request) {
        resolve(request.data)
      },
      fail(error) {
        reject(error)
      }
    })
  });
}
module.exports ={
  login:(data) =>{
    console.log("登录")
    return post('/users/login',data,'json') //微信登录
  },
  getList:(data) => {
    return get('/shares/query',data)  //获取数据
  },
  duihuan:(data) => {
    return post('/shares/exchange',data,'json') //兑换
  },
  contribute:(data) => {
    return post('/shares/contribute',data,'json') //投稿
  },
  signIn: (data) => {
    return post('/users/signin',data,'json') // 签到
  },
  myContribute: (data) => {
    return post('/shares/myContribute',data,'json') //查询我的投稿
  },
  myShare: (data) => {
    return post('/shares/myShare',data,'json') //查询我的兑换
  },
  audit:(data) => {
    return put('/admin/shares/audit/{id}',data,'json')//审核
  },
  getNotic:() =>{
    console.log('获取最新公告')
    return get('/notice/one') //获取最新公告
  },
  myLog: (data) => {
    return post('/users/mylog',data,'json') //我的积分明细
  },
}