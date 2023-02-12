import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:chatgpt_virtual_assistant/core/errors/exceptions.dart';
import 'package:chatgpt_virtual_assistant/core/errors/respone_error_helper.dart';

class DioHelper
{
  static String baseUrl = "https://app.chatgpt_virtual_assistant.tv";
  static String api = baseUrl;
  

  final ResponseErrorHelper responseErrorHelper = ResponseErrorHelper();
  Dio dio = Dio(
    BaseOptions(
      headers: {
        'content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, PATCH, DELETE',
        // If needed
        'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
        // If needed
        'Access-Control-Allow-Credentials': true
        // If  needed
      },
    ),
  );
  DioHelper(){
    if(!kIsWeb) {
      _fixCertificateProblem();
    }
  }
  void _fixCertificateProblem(){
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<dynamic> postDataWithoutToken(String parameter, dynamic data) async
  {
    final response = await dio.post('$api/$parameter',
        data: data ,
        options: Options(
          method: 'POST',
          validateStatus: (state) => state! < 500,
          // followRedirects: false,
          // validateStatus: (status) => true,
        )
    );
    return handleResponse(response);
  }

  Future<dynamic> postData(String parameter, dynamic data,{Options? options}) async
  {
    final response = await dio.post(
      '$api/$parameter',
      data: data,
      options: options ??
          Options(
            contentType: 'application/json',
            method: 'POST',
            validateStatus: (state) => state! < 500,
          ),
    );
    return handleResponse(response);
  }

  Future<dynamic> postDataWithFormData(String parameter, dynamic data,) async
  {
    log(data.toString());
    FormData formData = FormData.fromMap(data);
    return postData(parameter, formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data;charset=UTF-8',
          'Charset': 'utf-8'
        },
        method: 'POST',
        validateStatus: (state) => state! < 500,
      ),
    );
  }


  Future<dynamic> postWithoutDataWithToken(String parameter, ) async
  {
    final response = await dio.post('$api/$parameter',);
    return handleResponse(response);
  }


  Future<dynamic> putData(String parameter, Map<String, dynamic> data,) async
  {
    
    final response = await dio.put('$api/$parameter',
        data: json.encoder.convert(data),
        options: Options(
          contentType: 'application/json',
          method: 'PUT',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<void> delData(String parameter,) async
  {
    
    final response = await dio.delete('$api/$parameter',
        options: Options(
          contentType: 'application/json',
          method: 'DEL',
          validateStatus: (state) => state! < 500,
        ));
  }

  Future<Map<String,dynamic>> getDataWithoutToken(String parameter) async
  {
      Response response = await dio.get('$api/$parameter');
      return handleResponse(response);
  }

  Future<dynamic> getData(String parameter) async
  {
    log(parameter);
    Response response = await dio.get('$api/$parameter',);
    return handleResponse(response);
  }

  Future<dynamic> getDataWithBody(String endPoint,Map<String,dynamic> body) async
  {
    Response response = await dio.get('$api/$endPoint',queryParameters:body );
    return handleResponse(response);
  }

  dynamic handleResponse(Response response){
    if(response.statusCode.toString()[0] != "2"){
      log(response.data.toString());
      String message = responseErrorHelper.getErrorsMessageFromJson(response.data);
      throw ServerException(exceptionMessage: message,);
    }
    log(response.data.toString());
    try{
      return json.decode(response.data);
    }
    catch(e){
      return response.data;
    }
  }
}
