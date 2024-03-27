import 'package:flutter/material.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Others/Category%20Page/categorey.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';

class CandidateSettings extends StatelessWidget {
  const CandidateSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Settings'),
        ),
        body: Center(
          child: CustomButton(
            title: 'Logout',
            onPress: () {
              AuthRepo.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CategoreyPage()),
              );
            },
          ),
        ));
  }
}
