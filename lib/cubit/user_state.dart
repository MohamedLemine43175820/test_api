 import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

// states pour sign in
 final class SignInLoadingState extends UserState {}
 final class SignInSuccessState extends UserState {}
 final class SignInErrorState extends UserState {

  final String errorMessage  ;

  SignInErrorState({required this.errorMessage});
 }

 // 3. pour change state si user choose image from galery change circleAvatar

 final class UploadProfilPicState extends UserState {}



 // states pour sign up
 final class SignUpLoadingState extends UserState {}
 final class SignUpSuccessState extends UserState {
 final String message ;

  SignUpSuccessState({required this.message});
 }
 final class SignUpErrorState extends UserState {

  final String errorMessage  ;

  SignUpErrorState({required this.errorMessage});
 }



 // states pour get user data


 final class GetUserloadingState extends UserState {}

 final class GetUserSuccessState extends UserState {
  final UserModel user ;                                 // pour recive data et

  GetUserSuccessState({required this.user});
 }

 final class GetUserErrorState extends UserState {

  final String errorMessage  ;

  GetUserErrorState({required this.errorMessage});
 }
