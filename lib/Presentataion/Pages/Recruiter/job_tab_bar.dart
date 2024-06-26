import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Jobs/recruiter_jobs_bloc.dart';

import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/applicants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_job_details.dart';

class JobsTabBar extends StatelessWidget {
  const JobsTabBar({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<RecruiterJobsBloc>().add(GetJobsEvent());
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          title: const Text('Job Details'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                    dividerHeight: 0,
                    //  indicatorWeight: 1,
                    // labelColor: AppColors.white,
                    // unselectedLabelColor: AppColors.blue,
                    //  indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: AppColors.blue,
                    // indicator: BoxDecoration(
                    //   color: AppColors.blue,
                    // ),
                    tabs: [
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Applicants",
                            style:
                                TextStyle(color: AppColors.black, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Job Details",
                            style:
                                TextStyle(color: AppColors.black, fontSize: 16),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ApplicantsScreen(
              id: id,
            ),
            RecruiterJobDetails(
              jobId: id,
            ),
          ],
        ),
      ),
    );
  }
}
