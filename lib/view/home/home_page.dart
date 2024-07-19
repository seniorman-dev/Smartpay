import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/controller/repository/auth_service/auth_service.dart';
import 'package:smartpay/model/home/secret_response_model.dart';
import 'package:smartpay/utils/components/loader.dart';
import 'package:smartpay/utils/theme/app_theme.dart';





class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final authService = Get.put(AuthService());

  late Future<SecretResponse> homeFuture;

  @override
  void initState() {
    // TODO: implement initState
    homeFuture = authService.getSecretEndpoint(
      context: context, 
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Center(
          /*padding: EdgeInsets.symmetric(horizontal: 20.w),
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),*/

          //wrap with future builder
          child: FutureBuilder<SecretResponse>(
            future: homeFuture,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              if(snapshot.hasError) {
                log('snapshot err: ${snapshot.error}');
                return Text(
                  "couldn't fetch secret phrase",
                  style: GoogleFonts.roboto(
                    color: AppColor.textGreyColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400
                  ),
                );
              }
              if(!snapshot.hasData) {
                log('does the snapshot have any data?: ${snapshot.hasData}');
                return Text(
                  'no data found',
                  style: GoogleFonts.roboto(
                    color: AppColor.textGreyColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400
                  ),
                );
              }
              
              final data = snapshot.data!;

              return Text(
                textAlign: TextAlign.center,
                //"${authService.secreteTextController.text}",
                data.data['secret'] ?? 'nil',
                style: GoogleFonts.roboto(
                  color: AppColor.textGreyColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400
                ),
              );

              /*return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              
                  //5% of the screen
                  //SizedBox(height: MediaQuery.of(context).size.height * 0.05),  //0.08
                  
                  SvgPicture.asset(
                    'assets/svg/fp_user.svg',
                    height: 55.h,
                    width: 55.w,
                    fit: BoxFit.contain,
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
                    'Check out your secret below:',
                    style: GoogleFonts.roboto(
                      color: AppColor.textGreyColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
              
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
              
                  Text(
                    textAlign: TextAlign.center,
                    //"${authService.secreteTextController.text}",
                    data.data['secret'] ?? 'nil',
                    style: GoogleFonts.roboto(
                      color: AppColor.textGreyColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
              
                ]
              );*/

            }
          )
        )
      )
    );
  }
}