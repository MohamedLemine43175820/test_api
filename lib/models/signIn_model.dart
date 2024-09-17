import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

// this model to receive data from json if signIn succes

class SignInModel {


  final String  message ;

  final String token;

  SignInModel({required this.message , required this.token});

  factory SignInModel.fromJson(Map<String , dynamic> jsonData){

    return SignInModel(
        message: jsonData[ApiKey.message],
        token: jsonData[ApiKey.token],
    );

  }

}







/*




La ligne user = SignInModel.fromJson(reponse); signifie que l'on crée ou assigne un objet de type SignInModel
à partir d'une réponse JSON. Voici une explication détaillée de cette ligne de code :

1. user :
Il s'agit probablement d'une variable de type SignInModel. Elle représente l'utilisateur après s'être connecté
 ou avoir fourni ses informations de connexion.
2. SignInModel :
SignInModel est une classe de modèle (model class) qui représente les données de l'utilisateur qui se connecte.
Les modèles sont souvent utilisés pour structurer et organiser les données d'une réponse API dans des objets Dart.
3. fromJson(reponse) :
fromJson est une méthode définie dans la classe SignInModel qui prend un objet JSON (comme reponse)
et le transforme en une instance de SignInModel.
Le paramètre reponse est un objet JSON, probablement récupéré à partir d'une API, qui contient les informations
de l'utilisateur après un processus de connexion, comme le nom d'utilisateur, l'email, le token, etc.
 */




/*

"message": "Done",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZGY3NTEzZDE2OGU2YzdlOTY4OGM2ZiIsImVtYWlsIjoiaWUxOTk2MS5ldHVAaXNjYWUubXIiLCJuYW1lIjoibGVtaW5lIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjYwMDQ3NDh9.zDBPpyoDGVC4U5572YuDeNaU3DyUbh8_aEdK25hiJPU"
 */