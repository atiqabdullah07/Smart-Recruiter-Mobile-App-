import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:smart_recruiter/Business%20Logic/Get%20All%20Jobs/get_all_jobs_bloc.dart';

import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/job_details.dart';
import 'package:smart_recruiter/Presentataion/Widgets/cards.dart';

class AllJobsPage extends StatefulWidget {
  const AllJobsPage({super.key});

  @override
  State<AllJobsPage> createState() => _AllJobsPageState();
}

class _AllJobsPageState extends State<AllJobsPage> {
  void initState() {
    super.initState();
  }

  Future<void> _handleRefresh() async {
    context.read<GetAllJobsBloc>().add(GetJobsClickedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllJobsBloc, GetAllJobsState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case GetAllJobsSuccessState:
            final GetJobs = state as GetAllJobsSuccessState;

            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundColor,
                centerTitle: true,
                toolbarHeight: 80,
                title: const Text('All Jobs'),
              ),
              body: LiquidPullToRefresh(
                onRefresh: _handleRefresh,
                showChildOpacityTransition: false,
                backgroundColor: AppColors.white,
                height: 100.h,
                color: AppColors.blue,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: GetJobs.allJobs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: GetJobs.allJobs[index] != GetJobs.allJobs.last
                            ? EdgeInsets.only(
                                bottom: 12.h, left: 22.w, right: 22.w)
                            : EdgeInsets.only(
                                bottom: 100.h, left: 22.w, right: 22.w),
                        child: ColorfullCard(
                          color: cardColors[index % 6],
                          jobTitle: GetJobs.allJobs[index].title!,
                          jobType: GetJobs.allJobs[index].jobType!,
                          companyName: GetJobs.allJobs[index].companyName!,
                          date: GetJobs.allJobs[index].createdAt!,
                          companyLogo: GetJobs.allJobs[index].companyLogo!,
                          applyOnPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDetails(
                                        job: GetJobs.allJobs[index],
                                      )),
                            );
                          },
                          job: GetJobs.allJobs[index],
                        ),
                      );
                    }),
              ),
            );
          default:
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.backgroundColor,
                centerTitle: true,
                toolbarHeight: 80,
                title: const Text('All Jobs'),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Container(
                            height: 195,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    AppColors.supportiveGrey.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(30.r),
                              color: Colors.grey.shade100,
                            )),
                      );
                    }),
              ),
            );
        }
      },
    );
  }
}
