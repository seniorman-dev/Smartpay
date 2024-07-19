import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/controller/controller/auth/auth_controller.dart';
import 'package:smartpay/utils/components/buttons/auth_button.dart';
import 'package:smartpay/utils/components/buttons/back_button.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/auth/login/widget/auth_textfield.dart';
import 'package:smartpay/view/routes/web_routes.dart';







class ForgotPasswordScreen4 extends StatelessWidget {
  ForgotPasswordScreen4 ({super.key});

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
              CustomBackButton(
                onTap: () {
                  Get.offNamed(
                    OTPFPPageRoute,
                    arguments: {}
                  );
                }
              ),
                      
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              Text(
                textAlign: TextAlign.start,
                'Create New Password',
                style: GoogleFonts.roboto(
                  color: AppColor.mainColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 5.h), 
              Text(
                textAlign: TextAlign.start,
                'Please, enter a new password different from the previous password',
                style: GoogleFonts.roboto(
                  color: AppColor.textGreyColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              //password field
              AuthPasswordTextField(
                onChanged: (val) {},
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                textController: authController.forgotPasswordNewPasswordController,
                isObscured: false,
                validator: (val) => authController.validatePassword(value: val!),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),  
              //confirm password field
              AuthPasswordTextField(
                onChanged: (val) {},
                hintText: 'Confirm password',
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                textController: authController.forgotPasswordConfirmNewPasswordController,
                isObscured: false,
                validator: (val) => authController.validateConfirmPassword(firstValue: authController.forgotPasswordNewPasswordController.text, secondValue: val!)
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.37),  
      
              AuthButton(
                onPressed: () {
                  Get.toNamed(
                    SuccessFPPageRoute,
                    arguments: {}
                  );
                }, 
                backgroundColor: AppColor.mainColor, 
                text: 'Create new password', 
                textColor: AppColor.whiteColor
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),  
            
        
            ]
          ),          
        
        ),
      )
    );
  }
}