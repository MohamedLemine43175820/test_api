// interCeptor : comme man de la route

// utilise pour see request i send to database or response arrive


import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class ApiInterCeptor  extends Interceptor  {

  // Interceptor : contain some methods i can do ovrriede

  // dans cette methode cree code pour send with request like i can send headers

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.headers['Accept-language'] = 'en';                 // pour send headers with request

    // pour send token with request

    options.headers[ApiKey.token] = CacheHelper.getData(key: ApiKey.token) != null ? 'FOODAPI ${CacheHelper.getData(key: ApiKey.token)}': null;

    super.onRequest(options, handler);
  }





}