/* 
@description:baseUrl+所有的接口地址
 */
class Api {
  static const String baseUrl = "http://172.16.9.165:65000/new-life";
  static const String userlogin = baseUrl + "/user/login";
  static const String userRegister = baseUrl + "/user/register";
  static const String editUserInfo = baseUrl + "/user/info/edit";
  static const String pubArticle = baseUrl + "/article/publish";
  static const String queryArticle = baseUrl + "/article/info/all";
  static const String tencentCloudStorage =
      baseUrl + "/third/tencent_cloud_storage_credential";
}
