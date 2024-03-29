import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Jobs/recruiter_jobs_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/job_tab_bar.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_profile.dart';
import 'package:smart_recruiter/Presentataion/Widgets/cards.dart';

class RecruiterDashboard extends StatefulWidget {
  const RecruiterDashboard({super.key});

  @override
  State<RecruiterDashboard> createState() => _RecruiterDashboardState();
}

class _RecruiterDashboardState extends State<RecruiterDashboard> {
  void initState() {
    super.initState();

    context.read<RecruiterJobsBloc>().add(GetJobsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecruiterJobsBloc, RecruiterJobsState>(
      listener: (context, state) {
        if (state is GetPostsSuccessState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case GetPostsSuccessState:
            final GetJobs = state as GetPostsSuccessState;
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RecruiterProfile()),
                              );
                            },
                            child: GetJobs.companyLogo == '' ||
                                    GetJobs.companyLogo == 'null'
                                ? CircleAvatar(
                                    radius: 40.r,
                                    backgroundColor:
                                        AppColors.teal.withOpacity(0.2),
                                    child: Icon(
                                      Icons.person,
                                      size: 40.r,
                                      color: AppColors.blue,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 40.r,
                                    backgroundColor: AppColors.blue,
                                    child: CircleAvatar(
                                      radius: 38.r,
                                      backgroundColor: AppColors.supportiveGrey,
                                      backgroundImage:
                                          NetworkImage(GetJobs.companyLogo),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hello!",
                                style: TextStyle(
                                  color: AppColors.supportiveGrey,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                GetJobs.name,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Discover Best \nCandidate",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      headingRow(title: "My Jobs", onPress: () {}),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 600,
                        child: ListView.builder(
                            itemCount: GetJobs.myJobs.length,
                            itemBuilder: (context, index) {
                              return RecruiterJobsCard(
                                jobTitle: GetJobs.myJobs[index].title!,
                                jobType: GetJobs.myJobs[index].jobType!,
                                companyName: GetJobs.name,
                                date: GetJobs.myJobs[index].createdAt!,
                                companyLogo: GetJobs.companyLogo,
                                onTap: () {
                                  print(
                                    GetJobs.myJobs[index].id.toString(),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => JobsTabBar(
                                                id: GetJobs.myJobs[index].id
                                                    .toString(),
                                              )));
                                },
                              );
                            }),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            );

          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  Row headingRow({required String title, required VoidCallback onPress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.black,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            "Show all",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.supportiveGrey,
            ),
          ),
        ),
      ],
    );
  }
}
