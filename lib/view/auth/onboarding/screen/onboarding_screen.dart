import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smartpay/controller/controller/auth/auth_controller.dart';
import 'package:smartpay/utils/components/buttons/get_started_button.dart';
import 'package:smartpay/utils/components/buttons/skip_button.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/routes/web_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';





class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  //Dependency Injection
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: buildBody(context, controller),
    );
  }

  Widget buildBody(BuildContext context, AuthController controller) {

    final size = MediaQuery.of(context).size;
    final PageController pageViewController = PageController(initialPage: controller.activePage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [  
        SizedBox(height: MediaQuery.of(context).size.height * 0.06,), 
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: OnbSkipButton(
              onSkip: () {
                Get.offAllNamed(
                  LoginPageRoute,
                  arguments: {}
                );
              }
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.07,), //0.12.h
        //PageView.builder() Widget
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65.h, //0.67
          width: size.width,  //double.infinity
          child: PageView.builder( 
            scrollDirection: Axis.horizontal,
            itemCount: controller.pages.length,
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                controller.activePage = value;
              });
              debugPrint('${controller.activePage}');
            },
            itemBuilder: (context, index) {
              return controller.pages[index];
            }
          ),
        ),
        //SizedBox(height: 30),
        //SmoothPageIndicator
        SmoothPageIndicator(
          //activeIndex: activePage,
          controller: pageViewController, 
          count: controller.pages.length,  
          onDotClicked: (index) {
            pageViewController.animateToPage(
              index, 
              duration: const Duration(milliseconds: 300), 
              curve: Curves.elasticInOut
            );
          }, 
          effect: WormEffect(
            dotHeight: 8.0.h,  //8
            dotWidth: 30.0.w, //20.0
            spacing: 6.0.w,
            dotColor: AppColor.textGreyColor.withOpacity(0.1),
            activeDotColor: AppColor.mainColor,
            type: WormType.thinUnderground,
          ),
        ),                  
        
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),

        //buttons
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
          child: GetStartedButton(
            onGetStarted: () {
              Get.offAllNamed(
                LoginPageRoute,
                arguments: {}
              );
            },
          )
        )
          
      ],  
    );
  }
}