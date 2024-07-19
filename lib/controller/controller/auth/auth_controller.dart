
import 'dart:developer';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as getx;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:smartpay/view/auth/onboarding/widget/first_page.dart';
import 'package:smartpay/view/auth/onboarding/widget/second_page.dart';








class AuthController extends getx.GetxController {


  //ONBOARDING SECTION//
  int activePage = 0;
  final List<Widget> pages = [
    const FirstPage(),
    const SecondPage(),
  ];

  //REGULAR EXPRESSIONS (REGEX)
  final emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
  );


  //LOGIN SECTION//
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();


  //REGISTRATION SECTION//
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController setPINController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final  emailOTPController = ''.obs;
  final selectCountryController = 'Select Country'.obs;
  //final TextEditingController confirmPasswordController = TextEditingController();

  //phone number selector
  final phone_code = "".obs; 
  void onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    phone_code.value = countryCode.dialCode.toString();
    //phone_code.isEmpty ? "+234" : phone_code.value;
    log("New Country Code Selected: ${phone_code.value}");
    update();
  }

  //for selecting country upon registration
  Future<void> chooseCountry({required BuildContext context, required getx.RxString selectedCountry}) async{
    showCountryPicker(
      context: context,
      showPhoneCode: false, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        selectedCountry.value = country.countryCode;
        log('Select country: ${selectedCountry.value}');
      },
    );
    update();
  }






  //FORGOT PASSWORD SECTION//
  TextEditingController forgotPasswordEmailController = TextEditingController();
  TextEditingController forgotPasswordOTPController = TextEditingController();
  TextEditingController forgotPasswordNewPasswordController = TextEditingController();
  TextEditingController forgotPasswordConfirmNewPasswordController = TextEditingController();
  
  
  //VALIDATORS
  String? validateFullName({required String value}) {
    if(value.isEmpty) {
      return "Full name is required";
    }
    if (GetUtils.isLengthLessThan(value.trim(), 3)) {
      return "Full name is too short";
    } 
    return null;
  }

  String? validateUserName({required String value}) {
    if(value.isEmpty) {
      return "Username is required";
    }
    if (GetUtils.isLengthLessThan(value.trim(), 3)) {
      return "Username is too short";
    }
    return null;
  }


  String? validateEmail({required String value}) {
    if(value.isEmpty) {
      return "Email address is required";
    }
    if (!emailRegex.hasMatch(value) && !GetUtils.isEmail(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePhoneNumber({required String value}) {
    if(value.isEmpty) {
      return "Phone number is required";
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return "Please enter a valid phone number";
    }
    if (GetUtils.isLengthLessThan(value.trim(), 8)) {
      return "Phone number must be atleast 8 characters long";
    }
    return null;
  }

  String? validatePassword({required String value}) {
    if(value.isEmpty) {
      return "Password is required";
    }
    if (GetUtils.isLengthLessThan(value.trim(), 8)) {
      return "Password must be atleast 8 characters long";
    } 
    if (GetUtils.isAlphabetOnly(value)) {
      return "Password must be alphanumeric";
    } 
    if (GetUtils.isNumericOnly(value)) {
      return "Password must be alphanumeric";
    } 
    if (GetUtils.isPhoneNumber(value)) {
      return "Password can not be a phone number";
    } 
    return null;
  }

  String? validateConfirmPassword({required String firstValue, required String secondValue}) {
    if (GetUtils.isAlphabetOnly(secondValue)) {
      return "Password must be alphanumeric";
    } 
    if (GetUtils.isNumericOnly(secondValue)) {
      return "Password must be alphanumeric";
    } 
    if (GetUtils.isPhoneNumber(secondValue)) {
      return "Password can not be a phone number";
    }
    if(secondValue.isEmpty) {
      return "Password is required";
    }
    if (firstValue.trim() != secondValue.trim()) {
      return "Password do not match";
    }
    return null;
  }




  @override
  void dispose() {
    // TODO: implement dispose
    fullNameController.dispose();
    userNameController.dispose();
    setPINController.dispose();
    emailController.dispose();
    passwordController.dispose();
 
    forgotPasswordEmailController.dispose();
    forgotPasswordOTPController.dispose();
    forgotPasswordNewPasswordController.dispose();
    forgotPasswordConfirmNewPasswordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

}