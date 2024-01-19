import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String svgPath;
  final TextEditingController controller;
  final bool obsecureText;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.svgPath,
      required this.controller,
      required this.obsecureText})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obsecureText,
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: (value) {
        // Update the controller's text when the text field changes
        widget.controller.text = value;
      },
      decoration: InputDecoration(
        labelText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            widget.svgPath,
            height: 24.0,
            width: 24.0,
            color: _focusNode.hasFocus
                ? AppColors.teal
                : Colors.grey.withOpacity(0.3),
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.grey.withOpacity(0.3),
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
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
