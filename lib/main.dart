import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smart_recruiter/Business%20Logic/bloc/recruiter_login_bloc.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ScreenUtilInit(
    builder: (context, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<RecruiterLoginBloc>(
            create: (BuildContext context) => RecruiterLoginBloc(),
          )
        ],
        child: MaterialApp(
          title: "Smart Recruiter",
          home: Login(),
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
