import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/controller/controller/auth/auth_controller.dart';
import 'package:smartpay/utils/components/buttons/auth_button.dart';
import 'package:smartpay/utils/components/extractors.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/routes/web_routes.dart';







class RegistrationSuccesScreen extends StatelessWidget {
  RegistrationSuccesScreen({super.key});

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
                'Congratulations, ${getFirstName(fullName: authController.fullNameController.text)}',
                style: GoogleFonts.roboto(
                  color: AppColor.mainColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(height: 5.h), 
              
              Text(
                "You've completed the onboarding, you can start using.",
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
                  authController.fullNameController.clear();
                  authController.userNameController.clear();
                  authController.emailController.clear();
                  authController.passwordController.clear();
                  authController.setPINController.clear();
                  authController.emailOTPController.value = '';
                  authController.selectCountryController.value = '';
                  //navigate to home screen
                  Get.offAllNamed(
                    MainScreenPageRoute,
                    arguments: {}
                  );
                }, 
                backgroundColor: AppColor.mainColor, 
                text: 'Get Started', 
                textColor: AppColor.whiteColor
              ),
        
            ]
          ),          
        
        ),
      )
    );
  }
}