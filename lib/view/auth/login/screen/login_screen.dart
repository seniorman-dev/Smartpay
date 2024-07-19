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







class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
        
              Text(
                textAlign: TextAlign.start,
                'Hi There! 👋',
                style: GoogleFonts.roboto(
                  color: AppColor.mainColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 5.h), 
              Text(
                textAlign: TextAlign.start,
                'Welcome back. Sign in to your account',
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
                textController: authController.loginEmailController,
                validator: (val) => authController.validateEmail(value: val!)
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02), 
              //password field
              AuthPasswordTextField(
                onChanged: (val) {},
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                textController: authController.loginPasswordController,
                isObscured: false,
                validator: (val) => authController.validatePassword(value: val!)
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              
              //forgot password
              InkWell(
                onTap: () {
                  Get.toNamed(ForgotPasswordPageRoute);
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.roboto(
                    color: AppColor.greenColorDark,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600
                  ),
                )
              ), 

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              Obx(
                () {
                  return authService.isLoading.value ? Loader2(): AuthButton(
                    onPressed: () {
                      if(authController.loginEmailController.text.isEmpty && authController.loginPasswordController.text.isEmpty) {
                        showMessagePopup(
                          title: 'Uh oh!', 
                          message: 'please enter your login credentials', 
                          buttonText: 'Okay', 
                          context: context
                        );
                      }
                      else{
                        authService.loginEndpoint(
                          context: context, 
                          email: authController.loginEmailController.text, 
                          password: authController.loginPasswordController.text,
                          onSuccess: () {
                            authController.loginEmailController.clear();
                            authController.loginPasswordController.clear();
                            //navigate to home screen
                            Get.offAllNamed(
                              MainScreenPageRoute,
                              arguments: {}
                            );
                          },
                        );
                      }
                    }, 
                    backgroundColor: AppColor.mainColor, 
                    text: 'Sign in', 
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
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.13),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   "Don't have an account?",
                    style: GoogleFonts.roboto(
                      color: AppColor.textGreyColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RegisterPageRoute);
                    },
                    child: Text(
                      'Sign Up',
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