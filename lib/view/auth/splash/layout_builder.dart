import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/404page/unknown_route.dart';
import 'package:smartpay/view/auth/onboarding/screen/onboarding_screen.dart';





class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          //mobile view
          if(constraints.maxWidth < 600) {
            return OnboardingScreen();
          }
          //web view
          else {
            return const NoLaptopView();
          }
        }
      ),
    );
  }
}