import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/controller/controller/auth/auth_controller.dart';
import 'package:smartpay/controller/repository/auth_service/auth_service.dart';
import 'package:smartpay/utils/components/buttons/auth_button.dart';
import 'package:smartpay/utils/components/buttons/back_button.dart';
import 'package:smartpay/utils/components/buttons/thirdparty_auth_button.dart';
import 'package:smartpay/utils/components/loader.dart';
import 'package:smartpay/utils/components/my_snackbar.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/auth/login/widget/auth_textfield.dart';
import 'package:smartpay/view/routes/web_routes.dart';







class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final authController = Get.put(AuthController());
  final authService = Get.put(AuthService());

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
              
              /*SvgPicture.asset(
                'assets/svg/back_icon.svg',
                height: 55.h,
                width: 55.w,
                fit: BoxFit.contain,
              ),*/

              CustomBackButton(
                onTap: () {
                  //Get.back();
                  Get.offAllNamed(LoginPageRoute);
                },
              ),
                      
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 

              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Create a ',
                      style: GoogleFonts.roboto(
                        color: AppColor.mainColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: 'Smartpay\n',
                      style: GoogleFonts.roboto(
                        color: AppColor.greenColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: 'account',
                      style: GoogleFonts.roboto(
                        color: AppColor.mainColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ]
                )
              ),
        
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              //email field
              AuthTextField(
                onChanged: (val) {},
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textController: authController.emailController,
                validator: (val) => authController.validateEmail(value: val!),
              ),
  

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              Obx(
                () {
                  return authService.isLoading.value ? const Loader2() : AuthButton(
                    onPressed: () {
                      if(authController.emailController.text.isNotEmpty) {
                        authService.sendEmailOTPEndpoint(
                          context: context, 
                          email: authController.emailController.text, 
                          otp: authController.emailOTPController, 
                          onSuccess: () {
                            Get.offNamed(VerifyEmailPageRoute);
                          },
                        );
                      }
                      else{
                        showMessagePopup(
                          title: 'Uh oh!', 
                          message: 'please enter your email address', 
                          buttonText: 'Okay', 
                          context: context
                        );
                      }
                    
                    }, 
                    backgroundColor: AppColor.mainColor, 
                    text: 'Sign Up', 
                    textColor: AppColor.whiteColor
                  );
                }
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Divider(
                      //height: 2,
                      thickness: 0.5,
                      color: AppColor.greyColor,
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Text(
                   'OR',
                    style: GoogleFonts.roboto(
                      color: AppColor.textGreyColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Expanded(
                    child: Divider(
                      //height: 2,
                      thickness: 0.5,
                      color: AppColor.greyColor,
                    ),
                  ),
                ],
              ),
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTPAuthButton(
                      onTap: () {},
                      asset: 'assets/images/google.png',
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: CustomTPAuthButton(
                      onTap: () {},
                      asset: 'assets/images/apple.png',
                    ),
                  )
                ],
              ),
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.14),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   "Already have an account?",
                    style: GoogleFonts.roboto(
                      color: AppColor.textGreyColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  InkWell(
                    onTap: () {
                      //Get.back();
                      Get.offNamed(LoginPageRoute);
                    },
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.roboto(
                        color: AppColor.greenColorDark,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                ],
              ),
        
            ]
          ),          
        
        ),
      )
    );
  }
}