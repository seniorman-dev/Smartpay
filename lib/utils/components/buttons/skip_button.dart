import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/utils/theme/app_theme.dart';




class OnbSkipButton extends StatelessWidget {
  const OnbSkipButton({super.key, required this.onSkip});
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSkip,
      child: Text(
        'Skip',
        style: GoogleFonts.roboto(
          color: AppColor.greenColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600
        )
      )
    );
  }
}