import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_recruiter/Business%20Logic/Get%20All%20Jobs/get_all_jobs_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

import 'package:smart_recruiter/Presentataion/Pages/Candidate/search_job.dart';
import 'package:smart_recruiter/Presentataion/Widgets/cards.dart';
import 'package:smart_recruiter/Repository/GetX%20Controllers/candidate_controller.dart';

class CandidateDashboard extends StatefulWidget {
  const CandidateDashboard({super.key});

  @override
  State<CandidateDashboard> createState() => _CandidateDashboardState();
}

class _CandidateDashboardState extends State<CandidateDashboard> {
  void initState() {
    super.initState();
    context.read<GetAllJobsBloc>().add(GetJobsClickedEvent());
    _candidateController.getCandidateProfile();
  }

  final CandidateController _candidateController =
      Get.put(CandidateController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<GetAllJobsBloc, GetAllJobsState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case GetAllJobsSuccessState:
              final GetJobs = state as GetAllJobsSuccessState;
              return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40.r,
                                      backgroundColor: AppColors.blue,
                                      child: CircleAvatar(
                                        radius: 38.r,
                                        backgroundColor:
                                            AppColors.supportiveGrey,
                                        backgroundImage: NetworkImage(
                                            _candidateController
                                                .profilePic.value),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Hello!",
                                          style: TextStyle(
                                            color: AppColors.supportiveGrey,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          _candidateController.name.value,
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Discover Your \nFavourite Job",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Hero(
                                tag: 'Search Bar',
                                child: Container(
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.2)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.15), // Shadow color
                                          spreadRadius: 0, // Spread radius
                                          blurRadius: 10, // Blur radius
                                          offset: const Offset(0,
                                              0), // Offset in x and y directions
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25.w),
                                            child: TextField(
                                              readOnly: true,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SearchJobs()),
                                                );
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      color: AppColors
                                                          .supportiveGrey
                                                          .withOpacity(0.7),
                                                      fontSize: 16),
                                                  hintText:
                                                      "Search your dream job..."),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            color: AppColors.blue,
                                            borderRadius:
                                                BorderRadius.circular(200),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/icons/Search.svg",
                                              height: 22.h,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              headingRow(title: "Recent jobs", onPress: () {}),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CarouselSlider.builder(
                          options: CarouselOptions(
                              height: 195,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: ((index, reason) {
                                _candidateController.updatePageIndicator(index);
                              })),
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) {
                            return JobsCard(
                                jobTitle: GetJobs.allJobs[index].title!,
                                jobType: GetJobs.allJobs[index].jobType!,
                                companyName:
                                    GetJobs.allJobs[index].companyName!,
                                date: GetJobs.allJobs[index].createdAt!,
                                companyLogo:
                                    GetJobs.allJobs[index].companyLogo!,
                                job: GetJobs.allJobs[index],
                                applyOnPress: () {});
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 3; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor:
                                        _candidateController.carouselIndex == i
                                            ? AppColors.blue
                                            : Colors.grey.withOpacity(0.2),
                                  ),
                                )
                            ],
                          );
                        }),
                        SizedBox(
                          height: 25.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: headingRow(
                              title: "Top Companies", onPress: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: SizedBox(
                            height: 100.h,
                            child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      companiesList[index],
                                      width: 80,
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            default:
              return Scaffold(body: myCircularProgressIndicator());
          }
        },
      ),
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
