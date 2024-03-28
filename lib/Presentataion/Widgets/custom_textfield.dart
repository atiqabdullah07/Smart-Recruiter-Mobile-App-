import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String svgPath;
  final TextEditingController controller;
  final bool obsecureText;

  final String? Function(String?)?
      validator; // Change the type to match the validator function signature

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.svgPath,
      required this.controller,
      required this.obsecureText,
      required this.validator})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
//  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obsecureText,
      controller: widget.controller,
      //  focusNode: _focusNode,
      onChanged: (value) {
        // Update the controller's text when the text field changes
        widget.controller.text = value;
      },
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.blue,

      decoration: InputDecoration(
        labelText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.teal, // Set the border color when focused
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            widget.svgPath,
            color: AppColors.teal,
            height: 24.0,
            width: 24.0,
            //    color: _focusNode.hasFocus
            //      ? AppColors.teal
            //       : Colors.grey.withOpacity(0.5),
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.grey.withOpacity(0.8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.teal, // Set the border color when focused
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
