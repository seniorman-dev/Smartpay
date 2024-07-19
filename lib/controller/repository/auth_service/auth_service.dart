import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dioX;
import 'package:http/http.dart' as http;
import 'package:get/get.dart' as getx;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:smartpay/controller/repository/data_service/base_service/base_service.dart';
import 'package:smartpay/controller/repository/data_service/local_storage/local_storage.dart';
import 'package:smartpay/model/home/secret_response_model.dart';
import 'package:smartpay/utils/components/my_snackbar.dart';
import 'package:smartpay/utils/theme/app_theme.dart';




class AuthService extends getx.GetxController {

  final baseService = getx.Get.put(BaseService());
  //final mainPageController = getx.Get.put(MainPageController());
  final FCMToken = LocalStorage.getFCMToken();
  final tokenExpDateInt = LocalStorage.getTokenExpDate() ?? 0;
  final userId = LocalStorage.getUserID();
  final isLoading = false.obs;  

  
  Future<void> registerEndpoint({
    required BuildContext context,
    required String full_name,
    required String username,
    required String email,
    required String country,
    required String password,
    required VoidCallback onSuccess,
  }) async {
    isLoading.value = true;
    try {

      final body = {
        "full_name": full_name,
        "username": username,
        "email": email,
        "country": country,
        "password": password,
        "device_name": "web"
        //"fcmToken": FCMToken ?? "no token"
      };
      
      http.Response res = await baseService.httpPostAuth(endPoint: "auth/register", body: body);

      if (res.statusCode == 200 || res.statusCode == 201) {

        isLoading.value = false;
        debugPrint('this is response status ==> ${res.statusCode}');
        debugPrint('this is response body ==> ${res.body}');
        
        //decode the response from the server
        final dynamic response = json.decode(res.body);
        
        //get the value
        final Map<String, dynamic> data = response['data'];
        
        //void call back
        onSuccess();

        /*await pushNotiController.sendNotification(
          targetUserToken: FCMToken, 
          title: 'Hey, $firstName $lastName', 
          body: 'welcome to Smartpay..', 
          type: 'home' //navigate to home screen
        );*/
        showMySnackBar(
          context: context,
          backgroundColor: AppColor.mainColor,
          message: "registration successful"
        );
        

      } 
      else {
        isLoading.value = false;
        debugPrint('this is response body ==>${res.body}');
        debugPrint('this is response status ==>${res.statusCode}');
        debugPrint('this is response reason ==> ${res.reasonPhrase}');
        return baseService.showErrorMessage(context: context, httpStatusCode: res.statusCode);
      }
    }
    on FormatException catch(e, stackTrace){
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      showMessagePopup(
        title: 'Error (fmt)',
        message: "$e",
        buttonText: 'Dismiss',
        context: context
      );
    }
    on Exception catch(e, stackTrace) {
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      showMessagePopup(
        title: 'Error (exc)',
        message: "$e",
        buttonText: 'Dismiss',
        context: context
      );
    }
  }


  
  Future<void> loginEndpoint({
    required BuildContext context,
    required String email,
    required String password,
    required VoidCallback onSuccess,
  }) async {
    isLoading.value = true;
    try {

      final body = {
        "email": email,
        "password": password,
        "device_name": "web"
        //"fcmToken": FCMToken ?? "no token"
      };
      
      http.Response res = await baseService.httpPostAuth(endPoint: "auth/login", body: body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        isLoading.value = false;
        debugPrint('this is response status ==> ${res.statusCode}');
        debugPrint('this is response body ==> ${res.body}');
        
        //decode the response from the server
        final dynamic response = json.decode(res.body);
        
        //get the value
        final  Map<String, dynamic> data = response['data'];
        
        //void callback
        onSuccess();
        showMySnackBar(
          context: context,
          backgroundColor: AppColor.mainColor,
          message: "login successful"
        );

      }
      
      else {
        isLoading.value = false;
        debugPrint('this is response body ==>${res.body}');
        debugPrint('this is response status ==>${res.statusCode}');
        debugPrint('this is response reason ==> ${res.reasonPhrase}');
        return baseService.showErrorMessage(context: context, httpStatusCode: res.statusCode);
      }
    }

    on FormatException catch(e, stackTrace){
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      showMessagePopup(
        title: 'Error (fmt)',
        message: "$e",
        buttonText: 'Dismiss',
        context: context
      );
    }
    on Exception catch(e, stackTrace) {
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      showMessagePopup(
        title: 'Error (exc)',
        message: "$e",
        buttonText: 'Dismiss',
        context: context
      );
    }
  }


  //sent OTP to user email (upon account creation)
  Future<void> sendEmailOTPEndpoint({
    required BuildContext context,
    required String email,
    required getx.RxString otp,
    required VoidCallback onSuccess,
  }) async {
    isLoading.value = true;
    try {

      final body = {
        "email": email,
      };
      
      http.Response res = await baseService.httpPostAuth(endPoint: "auth/email", body: body);

      if (res.statusCode == 200 || res.statusCode == 201) {

        isLoading.value = false;
        debugPrint('this is response status ==> ${res.statusCode}');
        debugPrint('this is response body ==> ${res.body}');
        
        //decode the response from the server
        final dynamic response = json.decode(res.body);
        
        //get the value
        final String data = response['data']['token'];

        otp.value = data;

        log('received otp: $otp');

        onSuccess();
        
      } 
      
      else {
        isLoading.value = false;
        debugPrint('this is response body ==>${res.body}');
        debugPrint('this is response status ==>${res.statusCode}');
        debugPrint('this is response reason ==> ${res.reasonPhrase}');
        return baseService.showErrorMessage(context: context, httpStatusCode: res.statusCode);
      }
    }
    on FormatException catch(e, stackTrace){
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      showMessagePopup(
        title: 'Error (fmt)',
        message: "$e",
        buttonText: 'Dismiss',
        context: context
      );
    }
    on Exception catch(e, stackTrace) {
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      showMessagePopup(
        title: 'Error (exc)',
        message: "$e",
        buttonText: 'Dismiss',
        context: context
      );
    }
  }



  //verify email with the given OTP 
  Future<void> veryEmailEndpoint({
    required BuildContext context,
    required int token,
    required String email,
    required VoidCallback onSuccess,
  }) async {
    isLoading.value = true;
    try {

      final body = {
        "email": email,
        'token': token,
      };
      
      http.Response res = await baseService.httpPostAuth(endPoint: "auth/email/verify", body: body);

      if (res.statusCode == 200 || res.statusCode == 201) {

        isLoading.value = false;
        debugPrint('this is response status ==> ${res.statusCode}');
        debugPrint('this is response body ==> ${res.body}');
        
        //decode the response from the server
        final dynamic response = json.decode(res.body);
        
        //get the value
        final  Map<String, dynamic> data = response['data'];

        onSuccess();
        
      } 
      else {
        isLoading.value = false;
        debugPrint('this is response body ==>${res.body}');
        debugPrint('this is response status ==>${res.statusCode}');
        debugPrint('this is response reason ==> ${res.reasonPhrase}');
        return baseService.showErrorMessage(context: context, httpStatusCode: res.statusCode);
      }
  
    }
    on FormatException catch(e, stackTrace){
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      showMessagePopup(
        title: 'Error (fmt)',
        message: "$e",
        buttonText: 'Dismiss',
        context: context
      );
    }
    on Exception catch(e, stackTrace) {
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      showMessagePopup(
        title: 'Error (exc)',
        message: "$e",
        buttonText: 'Dismiss',
        context: context
      );
    }
  }


  Future<SecretResponse> getSecretEndpoint({
    required BuildContext context,
  }) async {
    isLoading.value = true;
    try {
      
      http.Response res = await baseService.httpGetAuth(endPoint: "dashboard",);

      if (res.statusCode == 200 || res.statusCode == 201) {

        isLoading.value = false;
        debugPrint('this is response status ==> ${res.statusCode}');
        debugPrint('this is response body ==> ${res.body}');
        
        //decode the response from the server
        final SecretResponse response = SecretResponse.fromJson(jsonDecode(res.body));
        
        //get the value
        final String data = response.data['secret'];

        log('generated secret phrase: $data');
        return response;
      }
      
      else {
        isLoading.value = false;
        debugPrint('this is response body ==>${res.body}');
        debugPrint('this is response status ==>${res.statusCode}');
        debugPrint('this is response reason ==> ${res.reasonPhrase}');
        baseService.showErrorMessage(context: context, httpStatusCode: res.statusCode);
        throw Exception('something went wrong');
      }
    }

    catch(e, stackTrace) {
      isLoading.value = false;
      debugPrint("$e");
      debugPrint("trace: $stackTrace");
      throw Exception("$e");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  

}

