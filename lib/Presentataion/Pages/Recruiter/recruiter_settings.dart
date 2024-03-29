import 'package:flutter/material.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Others/Category%20Page/categorey.dart';

import 'package:smart_recruiter/Repository/auth_repo.dart';

class RecruiterSettings extends StatelessWidget {
  const RecruiterSettings({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var setings = ['Change Password', 'Help & Feedback', 'About Us', 'Log Out'];
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          title: const Text('Settings'),
        ),
        body: ListView.builder(
          itemCount: setings.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: setings[index] == 'Log Out'
                  ? const EdgeInsets.symmetric(horizontal: 25, vertical: 65)
                  : const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Shadow color
                      spreadRadius: 0, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: setings[index] == 'Log Out'
                    ? InkWell(
                        onTap: () {
                          AuthRepo.logout();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoreyPage()),
                          );
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  setings[index],
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                setings[index],
                                style: TextStyle(
                                    color: AppColors.black80, fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.black80,
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            );
          },
        ));
  }
}
