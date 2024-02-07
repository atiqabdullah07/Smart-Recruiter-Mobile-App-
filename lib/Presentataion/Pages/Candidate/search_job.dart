import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_recruiter/Business%20Logic/Search%20Jobs/search_jobs_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/job_details.dart';
import 'package:smart_recruiter/Presentataion/Widgets/cards.dart';

class SearchJobs extends StatefulWidget {
  const SearchJobs({super.key});

  @override
  State<SearchJobs> createState() => _SearchJobsState();
}

class _SearchJobsState extends State<SearchJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        title: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15), // Shadow color
                spreadRadius: 0, // Spread radius
                blurRadius: 20, // Blur radius
                offset: const Offset(0, 0), // Offset in x and y directions
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: TextField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        context.read<SearchJobsBloc>().add(EmptyJobField());
                      }
                      context
                          .read<SearchJobsBloc>()
                          .add(JobSearchedEvent(value));

                      print(value);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: AppColors.supportiveGrey.withOpacity(0.5),
                            fontSize: 16),
                        hintText: "Search your dream job..."),
                  ),
                ),
              ),
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/Search.svg",
                    height: 22.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<SearchJobsBloc, SearchJobsState>(
        listener: (context, state) {
          if (state is SearchJobsSuccessState) {
            setState(() {});
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case SearchJobsSuccessState:
              final GetJobs = state as SearchJobsSuccessState;

              return Padding(
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
                          job: GetJobs.allJobs[index],
                        ),
                      );
                    }),
              );
            default:
              return SizedBox();

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 22.w),
            //   child: ListView.builder(
            //       physics: BouncingScrollPhysics(),
            //       itemCount: 6,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: EdgeInsets.only(bottom: 12.h),
            //           child: Container(
            //               height: 195,
            //               decoration: BoxDecoration(
            //                 border: Border.all(
            //                   color:
            //                       AppColors.supportiveGrey.withOpacity(0.2),
            //                 ),
            //                 borderRadius: BorderRadius.circular(30.r),
            //                 color: Colors.grey.shade100,
            //               )),
            //         );
            //       }),
            // );
          }
        },
      ),
    );
  }
}
