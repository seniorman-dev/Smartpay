
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/utils/theme/app_theme.dart';




class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.onPressed, required this.backgroundColor, required this.text, required this.textColor});
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 70.h, //60.h,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            color: AppColor.whiteColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}