import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

class BNB extends StatelessWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          screens: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: const Center(
                      child: Text("Hello"),
                    ),
                  ),
                ),
              ],
            ),
            // const Search(),
            Center(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
                child: SvgPicture.asset(
                  "assets/icons/user.svg", // Replace with the path to your SVG file
                  color: Colors.blue, // Change the color if needed
                ),
              ),
            ),
            Center(child: Image.asset("assets/logo.png")),
            const Center(
              child: Text("Hello 3"),
            ),
          ],
          items: [
            buildPersistentBottomNavBarItem(Icons.home_filled),
            buildPersistentBottomNavBarItem(Icons.account_circle_outlined),
            buildPersistentBottomNavBarItem(Icons.settings),
            buildPersistentBottomNavBarItem(Icons.settings),
          ],
          navBarStyle: NavBarStyle.style12,
          bottomScreenMargin: 0,
          resizeToAvoidBottomInset: true,
          hideNavigationBarWhenKeyboardShows: true,
          navBarHeight: 70.h,
          confineInSafeArea: false,
          padding: NavBarPadding.only(left: 30.w, right: 30.w),
          backgroundColor: AppColors.blue,
          margin: EdgeInsets.only(
            bottom: 10.h,
            left: 20.w,
            right: 20.w,
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

  PersistentBottomNavBarItem buildPersistentBottomNavBarItem(
      IconData iconData) {
    return PersistentBottomNavBarItem(
      icon: Icon(iconData),
      inactiveIcon: Icon(
        iconData,
        color: AppColors.white,
        size: 25.r,
      ),
      title: '.',
      activeColorSecondary: const Color(0xff192C62),
    );
  }
}
