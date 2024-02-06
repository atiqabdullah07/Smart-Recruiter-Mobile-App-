import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Business%20Logic/Get%20All%20Jobs/get_all_jobs_bloc.dart';

import 'package:smart_recruiter/Constants/app_constants.dart';
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
                title: const Text('All Jobs'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<GetAllJobsBloc>()
                            .add(GetJobsClickedEvent());
                      },
                      child: Text("test"))
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
                            companyLogo: GetJobs.allJobs[index].companyLogo!),
                      );
                    }),
              ),
            );
          default:
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
        }
      },
    );
  }
}
