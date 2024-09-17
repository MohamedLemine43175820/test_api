import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_interceptors.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/error_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer{                     // comme Bmw dans example

  final Dio dio ;                                   // object men dio

  DioConsumer({required this.dio}){

    dio.options.baseUrl = EndPoint.baseUrl ;               // add base url only

    dio.interceptors.add(ApiInterCeptor());                 // Interceptor qui execute with request
    dio.interceptors.add(LogInterceptor(                    // POUR see details request ou response

      request: true,
      requestHeader: true ,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error:  true,
    ));

  }




  @override
  Future delete(
      String path,{

        dynamic data,
        Map<String, dynamic>? queryParameters,
        bool isFromData = false ,
      }) async  {

      final response = await dio.delete(
      path,                                                                   // EndPoint
      data:isFromData ? FormData.fromMap(data) :  data,                       // body
      queryParameters: queryParameters,


    );

    try {
      return response.data; // pour nwsal data li  v reponse

      // pour handle DioException  error

    } on DioException catch (e) {
      handleDioException(e);
    }
    
  }






  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    
    try{

     final response = await  dio.get(
        path ,
        data:data ,
        queryParameters: queryParameters,


      );

     return response.data ;


    } on DioException catch(e){

      handleDioException(e);



    }
   
  }

  @override
  Future patch(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        bool isFromData = false ,

      }) async {

    try{

      final response = await  dio.patch(
        path ,
        data:isFromData ? FormData.fromMap(data):data ,
        queryParameters: queryParameters,


      );

      return response.data ;


    } on DioException catch(e){

      handleDioException(e);



    }

  }





  @override
  Future post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        bool isFromData = false ,

      }) async  {

    try{

      final response = await  dio.post(
        path ,
        data:isFromData? FormData.fromMap(data):data ,
        queryParameters: queryParameters,


      );

      return response.data ;


    } on DioException catch(e){

      handleDioException(e);



    }

  }

}



