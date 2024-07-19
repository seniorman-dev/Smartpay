import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:smartpay/controller/controller/auth/auth_controller.dart';
import 'package:smartpay/utils/components/buttons/auth_button.dart';
import 'package:smartpay/utils/components/buttons/back_button.dart';
import 'package:smartpay/utils/components/my_snackbar.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/routes/web_routes.dart';







class SetPinCodeScreen extends StatelessWidget {

  SetPinCodeScreen  ({super.key});
  
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
                  //Get.back();
                  Get.offNamed(MoreDetailsPageRoute);
                }
              ),
                      
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              Text(
                textAlign: TextAlign.start,
                "Set your PIN code",
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
                      text: "We use state-of-the-art security measures to protect your information at all times",
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
                fieldStyle: FieldStyle.underline,
                keyboardType: TextInputType.number,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: AppColor.bgColor, //fieldGreyColor,
                  //focusBorderColor: AppColor.greenColor,
                  //borderColor: AppColor.fieldGreyColor,
                  //enabledBorderColor: AppColor.greenColor,
                  //disabledBorderColor: AppColor.fieldGreyColor
                ),
                obscureText: true,
                //controller: OtpFieldController()
                onChanged: (val) {
                  authController.setPINController .text = val;
                  log(authController.setPINController .text);
                },
                onCompleted: (pin) {
                  log("Completed: $pin");
                },
              ),
              


              SizedBox(height: MediaQuery.of(context).size.height * 0.15),  
      
              AuthButton(
                onPressed: () {
                  if(authController.setPINController.text.isNotEmpty) {
                    Get.toNamed(
                      CongratulationsPageRoute,
                      arguments: {}
                    );
                  }
                  else{
                    showMessagePopup(
                      title: 'Uh oh!', 
                      message: 'please enter your desired withdrawal pin', 
                      buttonText: 'Okay', 
                      context: context
                    );
                  }
                }, 
                backgroundColor: AppColor.mainColor, 
                text: 'Create PIN', 
                textColor: AppColor.whiteColor
              ),
            
        
            ]
          ),          
        
        ),
      )
    );
  }
}