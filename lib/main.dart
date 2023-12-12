import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_recruiter/Business%20Logic/Post%20Job/post_job_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Login/recruiter_login_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Signup/recruiter_signup_bloc.dart';
import 'package:smart_recruiter/Presentataion/Pages/Others/onboarding.dart';

import 'package:smart_recruiter/Presentataion/Pages/Recruiter/job_post.dart';

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
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Smart Recruiter",
          home: OnBoarding(),
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
