import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dioX;
import 'package:get/get.dart' as getX;
import 'package:smartpay/controller/repository/data_service/local_storage/local_storage.dart';
import 'package:smartpay/utils/components/my_snackbar.dart';








class BaseService extends getX.GetxController {
  

  
  //Eroor Function that shows error messages upon HTTP Requests
  Future<dynamic> showErrorMessage({required int httpStatusCode, required BuildContext context}) async {
    switch (httpStatusCode) {
      case 200:
        return 'Success (POST)';
      case 201:
        return 'Success (PUT/PATCH)';
      case 400:
        //return 'Bad Request: The server could not understand the request due to invalid syntax.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Bad Request: The server could not understand the request due to invalid syntax.', 
          buttonText: 'Dismiss', 
          context: context
        );
      case 401:
        //return 'Unauthorized: The client must authenticate itself to get the requested response.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Unauthorized: The client must authenticate itself to get the requested response.',
          buttonText: 'Dismiss', 
          context: context
        );
      case 403:
        //return 'Forbidden: The client does not have access rights to the content.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Forbidden: The client does not have access rights to the content.',
          buttonText: 'Dismiss', 
          context: context
        );
      case 404:
        //return 'Not Found: The server can not find the requested resource.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Not Found: The server can not find the requested resource.',
          buttonText: 'Dismiss', 
          context: context
        );
      case 500:
        //return 'Internal Server Error: The server has encountered a situation it doesn\'t know how to handle.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Internal Server Error: The server has encountered a situation it doesn\'t know how to handle.',
          buttonText: 'Dismiss', 
          context: context
        );
      case 502:
        //return 'Bad Gateway: The server was acting as a gateway or proxy and received an invalid response from the upstream server.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Bad Gateway: The server was acting as a gateway or proxy and received an invalid response from the upstream server.',
          buttonText: 'Dismiss', 
          context: context
        );
      case 503:
        //return 'Service Unavailable: The server is not ready to handle the request. Common causes might be a server that is down for maintenance or that is overloaded.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Service Unavailable: The server is not ready to handle the request. Common causes might be a server that is down for maintenance or that is overloaded.',
          buttonText: 'Dismiss', 
          context: context
        );
      case 504:
        //return 'Gateway Timeout: The server is acting as a gateway or proxy and did not receive a timely response from the upstream server.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Gateway Timeout: The server is acting as a gateway or proxy and did not receive a timely response from the upstream server.',
          buttonText: 'Dismiss', 
          context: context
        );
      default:
        //return 'Unknown Error: An unexpected error occurred.';
        return showMessagePopup(
          title: 'Uh oh', 
          message: 'Unknown Error: An unexpected error occurred.',
          buttonText: 'Dismiss', 
          context: context
        );
    }   
  }







  //General Base URL
  String baseUrl = "https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/";
  

  ///HTTP SERVICES/// 
  //function that sends a GET request for Google Auth (on a soft)
  Future<http.Response> httpPostGoogle({required String endPoint, required dynamic body}) async {
    Uri url = Uri.parse("$baseUrl$endPoint");
    log('$url');
    final res = http.post(
      url,
      body: json.encode(body),
      headers:
      {
        "Accept": "*/*",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Content-Type": "application/json",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
      } 
    );
    return res;
  }

  //function that sends a GET request for POST Auth (on a soft)
  Future<http.Response> httpPostAuth({required String endPoint, required dynamic body}) async {
    Uri url = Uri.parse("$baseUrl$endPoint");
    log('$url');
    final res = http.post(
      url,
      body: json.encode(body),
      headers: 
      {
        "Accept": "*/*",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Content-Type": "application/json",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
      } 
    );
    return res;
  }


  //function that sends a PUT request  for resetting password (on a soft)
  Future<http.Response> httpPutAuth({required String endPoint, required dynamic body}) async {
    Uri url = Uri.parse("$baseUrl$endPoint");
    log('$url');
    final res = http.put(
      url,
      body: json.encode(body),
      headers:
      {
        "Accept": "*/*",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Content-Type": "application/json",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
      } 
    );
    return res;
  }


  //function that sends a GET request (on a soft without using jwt in the Header)
  Future<http.Response> httpGetAuth({required String endPoint}) async {
    Uri url = Uri.parse("$baseUrl$endPoint");
    log('$url');
    final res = http.get(
      url,
      headers: {
        //"Content-Type": "application/json",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
      },

    );
    return res;
  }

  /*Future<dioX.Response> httpGetAuth({required String endPoint}) async {
    try {
      String url = "$baseUrl$endPoint";
      log('Request URL: $url');

      dioX.Dio _dio = dioX.Dio();

      final response = await _dio.get(url);

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.data}');

      return response;
    } on dioX.DioException catch (e) {
      log('Dio error: $e');
      if (e.response != null) {
        log('Response status: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');
      }
      rethrow; // You can handle different status codes here if needed
    } catch (e) {
      log('Exception: $e');
      rethrow; // You can rethrow or handle the exception as needed
    }
  }*/

  









  ///X-refresh Token HEADERS/////////////////////////////////////
  //function that sends a GET request (on a soft)
  Future<dynamic> httpGet({required String endPoint}) async {
    final token = await LocalStorage.getToken();
    final xtoken = await LocalStorage.getXrefreshToken();
    Uri url = Uri.parse("$baseUrl$endPoint");
    log('$url');
    final res = http.get(
      url,
      headers: token != null ? 
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Content-Type": "application/json",
        "Connection": "keep-alive",
        "x-refresh": xtoken
      } 
      : null
    );
    return res;
  }

  //function that sends a POST request (on a soft)
  Future<http.Response> httpPost({required String endPoint, required dynamic body}) async {
    final token = await LocalStorage.getToken();
    final xtoken = await LocalStorage.getXrefreshToken();
    Uri url = Uri.parse("$baseUrl$endPoint");
    log('$url');
    final res = http.post(
      url,
      body: json.encode(body),
      headers: token != null ? 
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Content-Type": "application/json",
        "Connection": "keep-alive",
        "x-refresh": xtoken
      } 
      : null
    );
    return res;
  }
  
  //function that sends a PUT request (on a soft)
  Future<http.Response> httpPut({required String endPoint, required dynamic body}) async {
    final token = await LocalStorage.getToken();
    final xtoken = await LocalStorage.getXrefreshToken();
    Uri url = Uri.parse("$baseUrl$endPoint");
    log('$url');
    final res = http.put(
      url,
      body: json.encode(body),
      headers: token != null ? 
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Content-Type": "application/json",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "x-refresh": xtoken
      } 
      : null,
    );
    return res;
  }

  //function that sends a PATCH request (on a soft)
  Future<http.Response> httpPatch({required String endPoint, required dynamic body}) async {
    final token = await LocalStorage.getToken();
    final xtoken = await LocalStorage.getXrefreshToken();
    Uri url = Uri.parse("$baseUrl$endPoint");
    log('$url');
    final res = http.patch(
      url,
      body: json.encode(body),
      headers: token != null ? 
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        "Content-Type": "application/json",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "x-refresh": xtoken
      } 
      : null,
    );
    return res;
  }

  
  //function that sends a DELETE request (on a soft)
  Future<http.Response> httpDeleteWithBody({required String endPoint, dynamic body}) async {
    final token = await LocalStorage.getToken();
    final xtoken = await LocalStorage.getXrefreshToken();
    final res = http.delete(
      Uri.parse("$baseUrl$endPoint"),
      body: json.encode(body),
      headers: token != null ? 
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        "Content-Type": "application/json",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "x-refresh": xtoken
      } 
      : null
    );
    return res;
  }

  //function that sends a DELETE request (on a soft)
  Future<http.Response> httpDelete({required String endPoint,}) async {
    final token = await LocalStorage.getToken();
    final xtoken = await LocalStorage.getXrefreshToken();
    final res = http.delete(
      Uri.parse("$baseUrl$endPoint"),
      //body: json.encode(body),
      headers: token != null ? 
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        "Content-Type": "application/json",
        //'Content-Type': 'application/x-www-form-urlencoded',
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "x-refresh": xtoken
      } 
      : null
    );
    return res;
  }


}


