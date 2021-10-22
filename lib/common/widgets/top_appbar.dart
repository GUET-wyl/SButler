import 'package:SButler/common/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:SButler/common/global/public.dart';

//全背景图
class SelfAppbar extends StatelessWidget {
  void Function()? onBack;
  String? txt;
  Widget mainContent;
  SelfAppbar({
    Key? key,
    this.onBack,
    this.txt,
    required this.mainContent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(44.h),
          child: AppBar(
            backgroundColor: GlobalColor.c30,
            leading: GestureDetector(
              onTap: onBack,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                ),
                child: Image.asset(
                  'assets/images/back.png',
                  fit: BoxFit.cover,
                  width: 28.w,
                  height: 28.w,
                ),
              ),
            ),
            title: Text(
              txt!,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'PingFang SC',
                color: GlobalColor.c3f,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          child: mainContent,
        ),
      ),
    );
  }
}

//非全背景图
class SelfAppbar2 extends StatelessWidget {
  // void Function()? onClick;
  Widget mainContent;
  SelfAppbar2({
    Key? key,
    // this.onClick,
    required this.mainContent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: 0.0, //禁止手势侧滑出Drawer
        drawer: DrawerWidget(), //自定义的抽屉组件
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(44.h),
          child: AppBar(
            backgroundColor: GlobalColor.c30,
            leading: Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer(); //打开抽屉
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                    ),
                    child: Image.asset(
                      'assets/images/my.png',
                      fit: BoxFit.cover,
                      width: 28.w,
                      height: 28.w,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        body: Container(
          child: mainContent,
        ),
      ),
    );
  }
}

//无背景图
class SelfAppbar3 extends StatelessWidget {
  void Function()? onBack, onClick;
  String? txt, txt2;
  Widget mainContent;
  SelfAppbar3({
    Key? key,
    this.onBack,
    this.onClick,
    this.txt,
    this.txt2,
    required this.mainContent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(44.h),
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onBack,
                    child: Image.asset(
                      'assets/images/back.png',
                      fit: BoxFit.cover,
                      width: 28.w,
                      height: 28.w,
                    ),
                  ),
                  Text(
                    txt!,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'PingFang SC',
                      color: GlobalColor.c3f,
                    ),
                  ),
                  GestureDetector(
                    onTap: onClick,
                    child: Text(
                      txt2!,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'PingFang SC',
                        color: GlobalColor.c3f,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        body: Container(
          child: mainContent,
        ),
      ),
    );
  }
}

class SelfAppbar4 extends StatelessWidget {
  void Function()? onBack;
  String txt;
  Widget mainContent;
  SelfAppbar4({
    Key? key,
    this.onBack,
    required this.txt,
    required this.mainContent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(44.h),
          child: AppBar(
            backgroundColor: GlobalColor.c30,
            leading: GestureDetector(
              onTap: onBack,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                ),
                child: Image.asset(
                  'assets/images/back.png',
                  fit: BoxFit.cover,
                  width: 28.w,
                  height: 28.w,
                ),
              ),
            ),
            title: Text(
              txt,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'PingFang SC',
                color: GlobalColor.c3f,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          child: mainContent,
        ),
      ),
    );
  }
}
