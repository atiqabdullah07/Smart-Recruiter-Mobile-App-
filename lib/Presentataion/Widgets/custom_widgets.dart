import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    required this.onPress,
    this.color = AppColors.black,
    this.nextIcon = false,
  });

  final String title;
  final VoidCallback onPress;
  Color color;
  bool nextIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 60.h,
        width: 285,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            nextIcon == true
                ? const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.white,
                    size: 20,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomDialogWidget extends StatelessWidget {
  CustomDialogWidget(
      {super.key,
      this.isFailure = false,
      required this.title,
      required this.message,
      this.buttonText = 'OK'});

  bool isFailure;
  final String title;
  final String message;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 250.w,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.3),
                    // isFailure == true ? Colors.red : AppColors.teal,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                  child: Lottie.asset('assets/animations/tick_animation.json',
                      height: 200, fit: BoxFit.fill),

                  // Icon(
                  //   isFailure == true
                  //       ? Icons.highlight_off_rounded
                  //       : Icons.check_circle_outline,
                  //   size: 70,
                  //   color: Colors.white,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    message,
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 40),
                          backgroundColor:
                              isFailure == true ? Colors.red : AppColors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          buttonText,
                          style: const TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
