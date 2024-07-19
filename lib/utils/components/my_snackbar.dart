import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/utils/theme/app_theme.dart';





Future<void> showMySnackBar({required BuildContext context, required String message, required Color backgroundColor}) async{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.down,
      backgroundColor: backgroundColor,
      showCloseIcon: false,
      content: Text(
        textAlign: TextAlign.center,
        message,
        style: GoogleFonts.roboto(
          color: AppColor.whiteColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.normal
        ),
      ),
      duration: Duration(seconds: 2), // Adjust the duration as needed
    ),
  );
}




Future<void> showMessagePopup({ 
  required String title,
  required String message,
  required String buttonText, 
  required BuildContext context,
  }) async{
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        //barrierDismissible: true,
        elevation: 2,
        backgroundColor: AppColor.mainColor,
        //contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 20.h),
        content: Wrap(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      color: AppColor.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    message,
                    style: GoogleFonts.roboto(
                      color: AppColor.whiteColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400
                    ),
                    overflow: TextOverflow.clip,
                  ),
              
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                    
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: AppColor.whiteColor,
                      ),
                      height: 50.h,
                      //width: 110.w,
                      width: double.infinity,
                      child: Text(
                        buttonText,
                        style: GoogleFonts.roboto(
                          color: AppColor.mainColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600
                        )
                      )
                    ),
                  ),   
              
                ],
              ),
            ),
          ],
        ),
      );
    }
  );
}


