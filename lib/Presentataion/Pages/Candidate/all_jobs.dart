import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    context.read<GetAllJobsBloc>().add(GetJobsClickedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllJobsBloc, GetAllJobsState>(
      listener: (context, state) {
        if (state is GetAllJobsSuccessState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case GetAllJobsSuccessState:
            final GetJobs = state as GetAllJobsSuccessState;

            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundColor,
                centerTitle: true,
                title: const Text('All Jobs'),
                actions: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<GetAllJobsBloc>()
                            .add(GetJobsClickedEvent());
                      },
                      icon: Icon(Icons.refresh))
                ],
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: GetJobs.allJobs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: GetJobs.allJobs[index] != GetJobs.allJobs.last
                            ? EdgeInsets.only(bottom: 12.h)
                            : EdgeInsets.only(bottom: 100.h),
                        child: ColorfullCard(
                          color: cardColors[index % 6],
                          jobTitle: GetJobs.allJobs[index].title!,
                          jobType: GetJobs.allJobs[index].jobType!,
                          companyName: GetJobs.allJobs[index].companyName!,
                          date: GetJobs.allJobs[index].createdAt!,
                          companyLogo: GetJobs.allJobs[index].companyLogo!,
                          applyOnPress: () {
                            // print(GetJobs.allJobs[index].title!);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDetails(
                                        job: GetJobs.allJobs[index],
                                      )),
                            );
                          },
                        ),
                      );
                    }),
              ),
            );
          default:
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundColor,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                title: const Text('All Jobs'),
                actions: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<GetAllJobsBloc>()
                            .add(GetJobsClickedEvent());
                      },
                      icon: Icon(Icons.refresh))
                ],
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
