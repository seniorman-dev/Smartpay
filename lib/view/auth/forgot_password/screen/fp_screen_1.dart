import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/controller/controller/auth/auth_controller.dart';
import 'package:smartpay/utils/components/buttons/auth_button.dart';
import 'package:smartpay/utils/components/my_snackbar.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/auth/login/widget/auth_textfield.dart';
import 'package:smartpay/view/routes/web_routes.dart';







class ForgotPasswordScreen1 extends StatelessWidget {
  ForgotPasswordScreen1 ({super.key});

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
                'assets/svg/fp_lock.svg',
                //height: 55.h,
                //width: 55.w,
                fit: BoxFit.contain,
              ),
          
                      
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              Text(
                textAlign: TextAlign.start,
                'Password Recovery',
                style: GoogleFonts.roboto(
                  color: AppColor.mainColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 5.h), 
              Text(
                textAlign: TextAlign.start,
                'Enter your registered email below to receive password instructions',
                style: GoogleFonts.roboto(
                  color: AppColor.textGreyColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              //email field
              AuthTextField(
                onChanged: (val) {},
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textController: authController.forgotPasswordEmailController,
                validator: (val) => authController.validateEmail(value: val!)
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.10), 
      
              AuthButton(
                onPressed: () {
                  if(authController.forgotPasswordEmailController.text.isNotEmpty) {
                    Get.toNamed(
                      VerifyFPEmailRoute,
                      arguments: {}
                    );
                  }
                  else{
                    showMessagePopup(
                      title: 'Uh oh!', 
                      message: 'please enter your valid email address', 
                      buttonText: 'Okay', 
                      context: context
                    );
                  }
                
                }, 
                backgroundColor: AppColor.mainColor, 
                text: 'Send me email', 
                textColor: AppColor.whiteColor
              ),
            
        
            ]
          ),          
        
        ),
      )
    );
  }
}