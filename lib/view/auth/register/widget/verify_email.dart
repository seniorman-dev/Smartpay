import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:smartpay/controller/controller/auth/auth_controller.dart';
import 'package:smartpay/controller/repository/auth_service/auth_service.dart';
import 'package:smartpay/utils/components/buttons/auth_button.dart';
import 'package:smartpay/utils/components/buttons/back_button.dart';
import 'package:smartpay/utils/components/loader.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/routes/web_routes.dart';







class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen ({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  
  final authController = Get.put(AuthController());
  final authService = Get.put(AuthService());

  late Timer _timer;
  int _secondsRemaining = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 1) {
          _secondsRemaining--;
          debugPrint("timer: $_secondsRemaining");
        } 
        else {
          // Timer reached 0 seconds, navigate to password expired screen
          timer.cancel(); // Stop the timer
          /*Get.offNamed(
            widget.route
          );*/
        }
      });
    });
  }

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
                  //Get.back();
                  Get.offNamed(RegisterPageRoute);
                }
              ),
                      
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              Text(
                textAlign: TextAlign.start,
                "Verify it's you",
                style: GoogleFonts.roboto(
                  color: AppColor.mainColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 5.h), 
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'We sent a code to (',
                      style: GoogleFonts.roboto(
                        color: AppColor.textGreyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    TextSpan(
                      text: authController.emailController.text.replaceFirst(authController.emailController.text.substring(1,8), '*******'),
                      style: GoogleFonts.roboto(
                        color: AppColor.mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    TextSpan(
                      text: '). Enter it to verify your identity',
                      style: GoogleFonts.roboto(
                        color: AppColor.textGreyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ]
                )
              ),
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              //password field
              
                OTPTextField(
                    length: 5,
                    //width: 10.w,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 50.w, //50.w
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                    style: GoogleFonts.roboto(color: AppColor.mainColor, fontSize: 16.sp, fontWeight: FontWeight.w600),   
                    outlineBorderRadius: 10.w,   
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldStyle: FieldStyle.box,
                    keyboardType: TextInputType.number,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: AppColor.fieldGreyColor,
                      focusBorderColor: AppColor.greenColor,
                      borderColor: AppColor.fieldGreyColor,
                      enabledBorderColor: AppColor.greenColor,
                      disabledBorderColor: AppColor.fieldGreyColor
                    ),
                    //obscureText: true,
                    //controller: OtpFieldController()
                    onChanged: (val) {
                    
                      authController.emailOTPController.value = val;
                      log(authController.emailOTPController.value);
                    },
                    onCompleted: (pin) {
                      setState(() {
                        authController.emailOTPController.value = pin;
                      });
                      log("Completed: $pin");
                    },
                  ),
              
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 

              Center(
                child: InkWell(
                  onTap: _secondsRemaining == 1 
                  ? () {
                    //Get.back();
                    Get.offNamed(RegisterPageRoute);
                  } 
                  : () {
                    log('time has not yet elapsed');
                  },
                  child: Text(
                    _secondsRemaining == 1 ? 'Resend Code' :'Resend Code in ${_secondsRemaining}s',
                    style: GoogleFonts.roboto(
                      color: const Color.fromRGBO(114, 114, 114, 1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height * 0.1),  
      
              Obx(
                () {
                  return authService.isLoading.value ? Loader2() : AuthButton(
                    onPressed: () {
                      authService.veryEmailEndpoint(
                        context: context, 
                        token: int.parse(authController.emailOTPController.value), 
                        email: authController.emailController.text, 
                        onSuccess: () {
                          Get.toNamed(
                            MoreDetailsPageRoute,
                            arguments: {}
                          );
                        },
                      );
                
                    }, 
                    backgroundColor: AppColor.mainColor, 
                    text: 'Confirm', 
                    textColor: AppColor.whiteColor
                  );
                }
              ),
            
        
            ]
          ),          
        
        ),
      )
    );
  }
}