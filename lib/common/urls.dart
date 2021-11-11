/* 
@description:baseUrl+所有的接口地址
 */
class Urls {
  static const String baseUrl = "http://172.16.8.146:17900/sbutler";
  static const String login = baseUrl + "/auth/login";
  static const String register = baseUrl + "/auth/register";
  static const String logOut = baseUrl + "/auth/logout";
  static const String uploadAvatar = baseUrl + "/auth/uploadAvatar";
  static const String studyHistory = baseUrl + "/user/getStudyHistory";
  static const String userInfo = baseUrl + "/user/getUserInfo";
  static const String myAccount = baseUrl + "/user/getBalance";
  static const String totalLearnTime = baseUrl + "/user/getTotalTaskTime";
  static const String taskDetails = baseUrl + "/user/getDetails";
  static const String updateNickname = baseUrl + "/user/updateNickname";
  static const String updateAvatar = baseUrl + "/user/updateAvatar";
  static const String createTask = baseUrl + "/task/createTask";
  static const String finishTask = baseUrl + "/task/finishTask";
  static const String uploadFeedPhotos = baseUrl + "/feedback/filesUpload";
  static const String feedback = baseUrl + "/feedback/createFeedback";
}
