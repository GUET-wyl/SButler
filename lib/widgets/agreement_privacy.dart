import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//用户协议和隐私政策
class AgreementAndPrivacy extends StatelessWidget {
  const AgreementAndPrivacy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              text: '登录即代表同意',
              style: TextStyle(
                fontSize: 12.sp,
                color: GlobalColor.c3f,
                fontWeight: FontWeight.w400,
                fontFamily: 'PingFang SC',
              ),
              children: [
                TextSpan(
                  text: '用户协议',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: GlobalColor.c4d6,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFang SC',
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed('/user_agreement');
                    },
                ),
                TextSpan(
                  text: '和',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: GlobalColor.c3f,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFang SC',
                  ),
                ),
                TextSpan(
                  text: '隐私政策',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: GlobalColor.c4d6,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFang SC',
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('隐私政策');
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget agreement({
//   onClick,
// }) {
// return SelfAppbar(
//   mainContent: Column(),
//   onBack: () {},
//   txt: '用户协议',
// );
// }
class Agreement extends StatelessWidget {
  const Agreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelfAppbar(
      onBack: () {},
      txt: 'SButler用户协议',
      mainContent: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
              child: Text(
                '特别提示',
              ),
            ),
            Text(
              '成都托云信息科技有限公司（以下简称“成都托云”）在此特别提醒您（用户）在注册成为用户之前，请认真阅读（未成年人须在监护人陪同下阅读）本《用户协议》（以下简称“协议”），确保您充分理解本协议中各条款。特别提示您，本协议中包含隐私保护、未成年人保护、争议解决等涉及您重要权利处分的条款，请您审慎阅读并选择接受或不接受本协议。除非您接受本协议所有条款，否则您无权注册、登录或使用本协议所涉服务。您的注册、登录、使用等行为将视为对本协议的接受，并同意接受本协议各项条款的约束。',
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
              child: Text(
                '本协议约定成都托云与用户之间关于“SButler”软件服务（以下简称“服务”）的权利义务。“用户”是指注册、登录、使用本服务的个人。本协议可由成都托云随时更新，更新后的协议条款一旦公布即代替原来的协议条款，恕不再另行通知，用户可在本网站查阅最新版协议条款。在成都托云修改协议条款后，如果用户不接受修改后的条款，请立即停止使用成都托云提供的服务，用户继续使用成都托云提供的服务将被视为接受修改后的协议。',
              ),
            ),
            Text(
              '一、账号注册',
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
              child: Text(
                '1、用户在使用本服务前需要注册一个“SButler”帐号。“SButler”帐号是成都托云提供服务授予用户的凭证，“SButler”帐号是成都托云提供的计算机软件作品的一部分，即成都托云将相关产品计算机软件著作权授权给注册用户的授权凭证。成都托云可以根据用户需求或产品需要对帐号注册和绑定的方式进行变更，而无须事先通知用户。',
              ),
            ),
            Text(
              '2、您同意成都托云在注册时自动提取您的手机设备识别码等信息用于注册。',
            ),
          ],
        ),
      ),
    );
  }
}
