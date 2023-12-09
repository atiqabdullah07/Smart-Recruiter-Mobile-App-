import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smart_recruiter/Presentataion/Pages/Others/onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ScreenUtilInit(
    builder: (context, child) {
      return MaterialApp(
        title: "Smart Recruiter",
        home: const OnBoarding(),
        builder: EasyLoading.init(),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          // Preload Poppins font
          // Other theme configurations
        ),
      );
    },
    designSize: const Size(393, 852),
  ));
}
