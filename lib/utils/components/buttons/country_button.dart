import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/utils/theme/app_theme.dart';





class CountryButton extends StatelessWidget {
  const CountryButton({super.key, required this.onTap, required this.countryValue});
  final RxString countryValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //height: 70.h, //60.h,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColor.fieldGreyColor,
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () {
                return Text(
                  countryValue.value,
                  style: GoogleFonts.roboto(
                    color: AppColor.hintTextGreyColor, 
                    fontSize: 16.sp, 
                    fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.start,
                );
              }
            ),
            Icon(
              CupertinoIcons.chevron_down,
              //Icons.visibility_rounded, 
              color: AppColor.textGreyColor, 
              size: 24.r,
            )
          ],
        ),
      ),
    );
  }
}