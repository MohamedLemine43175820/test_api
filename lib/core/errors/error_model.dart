// cette class pour catch error sous from json mem net

// cette class cree depand on respone from api

// dans ce cas response contain

// status code and errorMessage

// this is model return si il ya un probleme ou error

import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class ErrorModel {

  final int status;
  final String errorMessage ;

  ErrorModel({ required this.status, required  this.errorMessage});

  factory ErrorModel.fromJson(Map<String , dynamic> jsonData){


     return ErrorModel(
         status:jsonData[ApiKey.status] ,
         errorMessage: jsonData[ApiKey.errorMessage],

     );

  }



}