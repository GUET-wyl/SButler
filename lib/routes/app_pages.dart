import 'package:SButler/pages/bad_net/bad_net.dart';
import 'package:SButler/pages/change_avatar/change_avatar.dart';
import 'package:SButler/pages/create_task/create_task.dart';
import 'package:SButler/pages/fail/fail.dart';
import 'package:SButler/pages/feedback/feedback.dart';
import 'package:SButler/pages/finish_task/finish_task.dart';
import 'package:SButler/pages/guide/guide.dart';
import 'package:SButler/pages/home/home.dart';
import 'package:SButler/pages/index/index.dart';
import 'package:SButler/pages/learn_record/learn_record.dart';
import 'package:SButler/pages/login/login.dart';
import 'package:SButler/pages/my_account/my_account.dart';
import 'package:SButler/pages/not_found/not_found.dart';
import 'package:SButler/pages/privacy_policy/privacy_policy.dart';
import 'package:SButler/pages/register/register.dart';
import 'package:SButler/pages/set/set.dart';
import 'package:SButler/pages/success/success.dart';
import 'package:SButler/pages/task_details/task_details.dart';
import 'package:SButler/pages/upload_photo/upload_photo.dart';
import 'package:SButler/pages/user_agreement/user_agreement.dart';
import 'package:SButler/widgets/dialog.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.GUIDE,
      page: () => const GuidePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 3),
    ),
    GetPage(
      name: AppRoutes.INDEX,
      page: () => const IndexPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.UP_PHOTO,
      page: () => UploadPhoto(),
    ),
    GetPage(
      name: AppRoutes.CHANGE_AVATAR,
      page: () => const ChangeAvatar(),
    ),
    GetPage(
      name: AppRoutes.CHANGE_NICK,
      page: () => DialogWidget(),
    ),
    GetPage(
      name: AppRoutes.USER_AGREEMENT,
      page: () => const UserAgreement(),
    ),
    GetPage(
      name: AppRoutes.PRIVACY_POLICY,
      page: () => const PrivacyPolicy(),
    ),
    GetPage(
      name: AppRoutes.FEED_BACK,
      page: () => FeedBackPage(),
    ),
    GetPage(
      name: AppRoutes.SET,
      page: () => SetPage(),
    ),
    GetPage(
      name: AppRoutes.SUCCESS_RESULT,
      page: () => const SuccessPage(),
    ),
    GetPage(
      name: AppRoutes.FAIL_RESULT,
      page: () => const FailPage(),
    ),
    GetPage(
      name: AppRoutes.LEARN_RECORDS,
      page: () => RecordsPage(),
    ),
    GetPage(
      name: AppRoutes.CREATE_TASK,
      page: () => CreateTask(),
    ),
    GetPage(
      name: AppRoutes.FINISH_TASK,
      page: () => FinishTaskPage(),
    ),
    GetPage(
      name: AppRoutes.MY_ACCOUNT,
      page: () => MyAccountPage(),
    ),
    GetPage(
      name: AppRoutes.TASK_DETAILS,
      page: () => TaskDetails(),
    ),
    GetPage(
      name: AppRoutes.NOT_FOUND,
      page: () => NotConPage(),
    ),
    GetPage(
      name: AppRoutes.BAD_NET,
      page: () => const NoNetPage(),
    ),
  ];
}
