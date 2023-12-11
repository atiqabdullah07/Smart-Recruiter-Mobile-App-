// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/job_post.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_dashboard.dart';

class RecruiterMainScreen extends StatelessWidget {
  const RecruiterMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          screens: [
            RecruiterDashboard(),
            JobPost(),
            const Center(
              child: Text("Hello 3"),
            ),
          ],
          items: [
            customIcon(activeIcon: "Home_Filled", unActiveIcon: "home"),
            PersistentBottomNavBarItem(
                icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 45.r,
            )),
            customIcon(activeIcon: "Setting_Filled", unActiveIcon: "Setting"),
          ],
          navBarStyle: NavBarStyle.style6,
          bottomScreenMargin: 0,
          resizeToAvoidBottomInset: true,
          hideNavigationBarWhenKeyboardShows: true,
          stateManagement: false,
          navBarHeight: 70.h,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
          ),
          confineInSafeArea: false,
          padding: NavBarPadding.only(left: 30.w, right: 30.w),
          backgroundColor: AppColors.blue,
          margin: EdgeInsets.only(
            bottom: 10.h,
            left: 50.w,
            right: 50.w,
          ),
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(50.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: -7.r,
                blurRadius: 10.r,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PersistentBottomNavBarItem customIcon(
      {required String activeIcon, required String unActiveIcon}) {
    return PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/navbaricons/$activeIcon.svg",
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/navbaricons/$unActiveIcon.svg",
        ),
        activeColorSecondary: AppColors.white);
  }
}
