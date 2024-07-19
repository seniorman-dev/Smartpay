import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/utils/components/buttons/auth_button.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/auth/login/widget/auth_textfield.dart';
import 'package:smartpay/view/routes/web_routes.dart';







class ForgotPasswordScreenSuccess extends StatelessWidget {
  ForgotPasswordScreenSuccess({super.key});

  //final authController = Get.put(AuthController());

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //5% of the screen
              SizedBox(height: MediaQuery.of(context).size.height * 0.22),  //0.08
              
              Image.asset(
                //'assets/svg/congrats.svg',
                'assets/images/congrats_pic.png',
                height: 200.h,
                width: 200.w,
                //fit: BoxFit.contain,
              ),
          
                      
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              Text(
                textAlign: TextAlign.center,
                'Reset Successful',
                style: GoogleFonts.roboto(
                  color: AppColor.mainColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(height: 5.h), 
              
              Text(
                "Your password has been changed successfully",
                style: GoogleFonts.roboto(
                  color: AppColor.textGreyColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.06), 
      
              AuthButton(
                onPressed: () {
                  Get.offAllNamed(
                    LoginPageRoute,
                    arguments: {}
                  );
                }, 
                backgroundColor: AppColor.mainColor, 
                text: 'Login', 
                textColor: AppColor.whiteColor
              ),
        
            ]
          ),          
        
        ),
      )
    );
  }
}