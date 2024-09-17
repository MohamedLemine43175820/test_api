// this class contain kinds of exceptions

// contient type exception
// par example exception pour api cree class names ServerException

// me creat exception 5as biye bach lyn yji n3rv 3ano jay mene api

import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/error_model.dart';

class ServerException implements Exception {

  final ErrorModel  errorModel;

  ServerException({ required this.errorModel});
}



// methode

// switch because there are 8 type from DioException


void handleDioException( DioException e)  {


  switch(e.type) {


  // first_type : 7 type request  does not  arrive to data base


    case DioExceptionType.connectionTimeout:


      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));


    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:

      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.cancel:

      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.connectionError:

      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));


  // Second_type : request arrive to database but there is in error  in request data icorect

    case DioExceptionType.badResponse:

      switch(e.response?.statusCode){
        case 400 :                            // Bad request

          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

        case 401 :                          // Unauthorized

          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

        case 403 :                         // forbidden

          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

        case 404 :                        // not found

          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));


        case 409 :                       // cofficent

          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));


        case 422 :

          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));


        case 504 :                          //serveur exception

          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));



      }

  }





}