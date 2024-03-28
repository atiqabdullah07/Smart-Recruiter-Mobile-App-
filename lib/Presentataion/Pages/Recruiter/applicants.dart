import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_recruiter/Business%20Logic/Recruiter%20Jobs/recruiter_jobs_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

class ApplicantsScreen extends StatefulWidget {
  const ApplicantsScreen({super.key, required this.id});

  final String id;

  @override
  State<ApplicantsScreen> createState() => _ApplicantsScreenState();
}

class _ApplicantsScreenState extends State<ApplicantsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RecruiterJobsBloc>().add(GetApplicantsEvent(jobID: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecruiterJobsBloc, RecruiterJobsState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case GetApplicantsSuccessState:
            final applicants = state as GetApplicantsSuccessState;
            return Scaffold(
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListView.builder(
                  itemCount: applicants.applicants.length,
                  itemBuilder: (context, index) {
                    return rankingCard(
                        image: applicants.applicants[index].picture.toString(),
                        userName: applicants.applicants[index].name.toString(),
                        resumeScore:
                            applicants.applicants[index].score.toString(),
                        rank: '${index + 1}');
                  },
                ),
              ),
            );
          default:
            return myCircularProgressIndicator();
        }
      },
    );
  }

  Padding rankingCard(
      {required String image,
      required String userName,
      required String resumeScore,
      required String rank}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 120,
        width: 1.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  image == '' || image == 'null'
                      ? CircleAvatar(
                          radius: 35.r,
                          backgroundColor: AppColors.teal.withOpacity(0.2),
                          child: Icon(
                            Icons.person,
                            size: 35.r,
                            color: AppColors.blue,
                          ),
                        )
                      : CircleAvatar(
                          radius: 35.r,
                          backgroundColor: AppColors.black,
                          child: CircleAvatar(
                            radius: 33.r,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(image),
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
                        userName,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Resume Score: $resumeScore",
                        style: TextStyle(
                          color: AppColors.teal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '#',
                              style: TextStyle(
                                  color: AppColors.blue, fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          rank,
                          style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text('Rank')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
