import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/controller/controller/auth/auth_controller.dart';
import 'package:smartpay/utils/components/buttons/auth_button.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/auth/login/widget/auth_textfield.dart';
import 'package:smartpay/view/routes/web_routes.dart';







class ForgotPasswordScreen2 extends StatelessWidget {
  ForgotPasswordScreen2 ({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //5% of the screen
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),  //0.08
              
              SvgPicture.asset(
                'assets/svg/fp_user.svg',
                //height: 55.h,
                //width: 55.w,
                fit: BoxFit.contain,
              ),
          
                      
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              Text(
                textAlign: TextAlign.start,
                'Verify your identity',
                style: GoogleFonts.roboto(
                  color: AppColor.mainColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 5.h), 
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Where would you like ',
                      style: GoogleFonts.roboto(
                        color: AppColor.textGreyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    TextSpan(
                      text: 'Smartpay ',
                      style: GoogleFonts.roboto(
                        color: AppColor.greenColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: 'to send your security code?',
                      style: GoogleFonts.roboto(
                        color: AppColor.textGreyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ]
                ),
              ),
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              //email card
              Container(
                //height: 70.h, //60.h,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.fieldGreyColor,
                  borderRadius: BorderRadius.circular(20.r)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/svg/check.svg'),
                    SizedBox(width: 20.w,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: GoogleFonts.roboto(
                                  color: AppColor.mainColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Text(
                                authController.forgotPasswordEmailController.text.replaceFirst(authController.forgotPasswordEmailController.text.substring(1,8), '*******'),
                                style: GoogleFonts.roboto(
                                  color: AppColor.textGreyColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          SvgPicture.asset('assets/svg/email.svg'),
                        ],
                      ),
                    )
                  ],
                )
              ),


              SizedBox(height: MediaQuery.of(context).size.height * 0.40), 
      
              AuthButton(
                onPressed: () {
                  Get.toNamed(
                    OTPFPPageRoute,
                    arguments: {}
                  );
                }, 
                backgroundColor: AppColor.mainColor, 
                text: 'Continue', 
                textColor: AppColor.whiteColor
              ),
            
        
            ]
          ),          
        
        ),
      )
    );
  }
}