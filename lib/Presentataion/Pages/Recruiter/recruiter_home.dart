// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import 'package:flutter_svg/svg.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Jobs/recruiter_jobs_bloc.dart';

import 'package:smart_recruiter/Constants/app_constants.dart';

import 'package:smart_recruiter/Presentataion/Pages/Recruiter/job_post.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_dashboard.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_settings.dart';

class RecruiterHome extends StatefulWidget {
  const RecruiterHome({Key? key}) : super(key: key);

  @override
  State<RecruiterHome> createState() => _RecruiterHomeState();
}

class _RecruiterHomeState extends State<RecruiterHome>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    context.read<RecruiterJobsBloc>().add(GetJobsEvent());

    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          bottomNavigationBar: BottomBar(
            child: TabBar(
              tabs: [
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                    child: currentPage == 0
                        ? SvgPicture.asset(
                            "assets/navbaricons/Home_Filled.svg",
                          )
                        : SvgPicture.asset("assets/navbaricons/home.svg"),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 0),
                  child: FloatingActionButton(
                    elevation: 2,
                    backgroundColor: AppColors.teal,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => JobPost()));
                    },
                    child: Icon(
                      Icons.add,
                      size: 25,
                      color: AppColors.white,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 40,
                  child: Center(
                    child: currentPage == 3
                        ? SvgPicture.asset(
                            "assets/navbaricons/Setting_Filled.svg",
                          )
                        : SvgPicture.asset("assets/navbaricons/Setting.svg"),
                  ),
                ),
              ],
              controller: tabController,
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 4,
                ),
                insets: EdgeInsets.fromLTRB(16, 10, 16, 6),
              ),
            ),
            fit: StackFit.expand,
            borderRadius: BorderRadius.circular(500),
            duration: Duration(seconds: 1),
            curve: Curves.decelerate,
            showIcon: true,
            width: MediaQuery.of(context).size.width * 0.6,
            barColor: AppColors.blue,
            start: 2,
            end: 0,
            offset: 10,
            barAlignment: Alignment.bottomCenter,
            iconHeight: 35,
            iconWidth: 35,
            reverse: false,
            hideOnScroll: true,
            scrollOpposite: false,
            body: (context, controller) => SafeArea(
              child: TabBarView(
                  controller: tabController,
                  dragStartBehavior: DragStartBehavior.down,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    RecruiterDashboard(),
                    JobPost(),
                    RecruiterSettings(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
