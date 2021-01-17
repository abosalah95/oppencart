import 'dart:async';
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import '../custom_exception.dart';


class ApiProvider {


  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal();


  Future<dynamic> getRequestAPI({String url}) async {
    try {
      print("ApiProvider : $url");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
          print("ApiProvider : Done Send API");
          return data;
      } else {
        print("response : " + response.body);
        throw MyException(
          message: response.body,
          error: response.statusCode,
        );
      }
    } on TimeoutException catch (e) {
      print(e.message);
      throw MyException(
        message: tr('an_error_occurred_please_try_again'),
        error: 101,
      );
    } on SocketException catch (e) {
      print(e.message);
      throw MyException(
        message: tr('please_check_internet_connection'),
        error: 102,
      );
    }
  }

  Future<dynamic> postRequestAPI({String url,String body}) async {
    print("ApiProvider : $url");
    try {
      final response = await http.post(url,body: body);
      if (response.statusCode == 200) {
        print("response : " + response.body);
        dynamic data = json.decode(response.body);
          print("ApiProvider : Done Send API");
        return data;
      } else {
        print("response : " + response.body);
        throw MyException(
          message: response.body,
          error: response.statusCode,
        );
      }
    } on TimeoutException catch (e) {
      print(e.message);
      throw MyException(
        message: tr('an_error_occurred_please_try_again'),
        error: 101,
      );
    } on SocketException catch (e) {
      print(e.message);
      throw MyException(
        message: tr('please_check_internet_connection'),
        error: 102,
      );
    }
  }

}
