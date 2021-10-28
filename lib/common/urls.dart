/* 
@description:baseUrl+所有的接口地址
 */
class Urls {
  static const String baseUrl = "http://172.168.21.218:17900/sbutler";
  static const String login = baseUrl + "/auth/login";
  static const String register = baseUrl + "/auth/register";
  static const String logOut = baseUrl + "/auth/logout";
  static const String uploadAvatar = baseUrl + "/auth/uploadAvatar";
  static const String myAccount = baseUrl + "/user/getBalance";
  static const String totalLearnTime = baseUrl + "/user/getTotalTaskTime";
  static const String updateNickname = baseUrl + "/user/updateNickname";
  static const String studyHistory = baseUrl + "/user/getStudyHistory";
  static const String balanceDetails = baseUrl + "/user/getBalance";
  static const String finishTask = baseUrl + "/task/createTask";
  static const String createTask = baseUrl + "/task/finishTask";
  static const String feedback = baseUrl + "/feedback/createFeedback";
}
