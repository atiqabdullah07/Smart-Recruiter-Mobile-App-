import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_recruiter/Business%20Logic/Candidate%20Login/candidate_login_bloc.dart';

import 'package:smart_recruiter/Business%20Logic/Candidate%20SignUp/candidate_sign_up_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Get%20All%20Jobs/get_all_jobs_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Post%20Job/post_job_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Jobs/recruiter_jobs_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Login/recruiter_login_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Signup/recruiter_signup_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Search%20Jobs/search_jobs_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/candidate_home.dart';
import 'package:smart_recruiter/Presentataion/Pages/Others/Category%20Page/categorey.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_home.dart';

import 'package:smart_recruiter/Repository/auth_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
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
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Smart Recruiter",
          home: MainScreen(),
          builder: EasyLoading.init(),
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            indicatorColor: AppColors.blue,
            scaffoldBackgroundColor: AppColors.backgroundColor,
            primaryColor: AppColors.blue,
            // Preload Poppins font
            // Other theme configurations
          ),
        ),
      );
    },
    designSize: const Size(393, 852),
  ));
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? _userType;

  @override
  void initState() {
    super.initState();
    _getUserType();
  }

  Future<void> _getUserType() async {
    final userType = await AuthRepo.getUserType();
    setState(() {
      _userType = userType;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userType == null) {
      return CategoreyPage(); // or any loading widget
    } else if (_userType == AuthRepo.candidateType) {
      return CandidateHome();
    } else if (_userType == AuthRepo.recruiterType) {
      return RecruiterHome();
    } else {
      return Text('Unknown user type');
    }
  }
}
