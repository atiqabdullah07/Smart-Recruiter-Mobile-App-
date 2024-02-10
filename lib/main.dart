import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_recruiter/Business%20Logic/Candidate%20Login/candidate_login_bloc.dart';

import 'package:smart_recruiter/Business%20Logic/Candidate%20SignUp/candidate_sign_up_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Get%20All%20Jobs/get_all_jobs_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Post%20Job/post_job_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Jobs/recruiter_jobs_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Login/recruiter_login_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Signup/recruiter_signup_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Search%20Jobs/search_jobs_bloc.dart';

import 'package:smart_recruiter/Test%20Files/new_file.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ScreenUtilInit(
    builder: (context, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<RecruiterLoginBloc>(
            create: (BuildContext context) => RecruiterLoginBloc(),
          ),
          BlocProvider<RecruiterSignupBloc>(
            create: (BuildContext context) => RecruiterSignupBloc(),
          ),
          BlocProvider<PostJobBloc>(
            create: (BuildContext context) => PostJobBloc(),
          ),
          BlocProvider<RecruiterJobsBloc>(
            create: (BuildContext context) => RecruiterJobsBloc(),
          ),
          BlocProvider<CandidateSignUpBloc>(
            create: (BuildContext context) => CandidateSignUpBloc(),
          ),
          BlocProvider<CandidateLoginBloc>(
            create: (BuildContext context) => CandidateLoginBloc(),
          ),
          BlocProvider<GetAllJobsBloc>(
            create: (BuildContext context) => GetAllJobsBloc(),
          ),
          BlocProvider<SearchJobsBloc>(
            create: (BuildContext context) => SearchJobsBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Smart Recruiter",
          home: BlocPractice(),
          builder: EasyLoading.init(),
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            // Preload Poppins font
            // Other theme configurations
          ),
        ),
      );
    },
    designSize: const Size(393, 852),
  ));
}
