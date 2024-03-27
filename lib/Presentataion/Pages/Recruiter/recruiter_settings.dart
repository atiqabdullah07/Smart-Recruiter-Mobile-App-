import 'package:flutter/material.dart';
import 'package:smart_recruiter/Presentataion/Pages/Others/Category%20Page/categorey.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';

class RecruiterSettings extends StatelessWidget {
  const RecruiterSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('RecruiterSettings'),
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
