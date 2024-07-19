import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/utils/theme/app_theme.dart';





class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key, required this.onGetStarted});
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onGetStarted,
      child: Container(
        height: 70.h, //60.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Text(
          'Get Started',
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