import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/function/upload_image_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/signIn_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/signup_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../core/api/api_consumer.dart';

class UserCubit extends Cubit<UserState> {                                          // comme  FixCars{} contient fix comme signIn



  final ApiConsumer api;                                                           // variable de type car par example
  UserCubit(this.api) : super(UserInitial());


  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();



//La déclaration XFile? profilePic en Dart signifie que la variable profilePic est de type XFile,
// mais elle peut également être nulle (null), ce qui est indiqué par le point d'interrogation (?).

  //Profile Pic
  XFile? profilePic;               // 1.cette variable pour stock image

  // 2. method pour si selctionner  image stock dans  profilePic

  uploadProfilPic (XFile image){

    profilePic = image ;

    emit(UploadProfilPicState ());
  }



  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();



  SignInModel? user ;                                     // cree user  pour stock response dans model




  // send request post signin


  signIn() async {

    try {

      emit(SignInLoadingState());

      final reponse = await api.post(

          EndPoint.signIn,                                                           // method endPoint

          data: {

            ApiKey.email: signInEmail.text,                                          // ApiKey.email <=> email dans base de donnees

            ApiKey.password: signInPassword,                                        // ApiKey.email <=> email dans base de donnees
          }

      );
      
      user = SignInModel.fromJson(reponse);                                        // user cntient token and message done


      // dechiffre token   ( site Jwt.io  pour dechiffre token et return de foramtion commme id )

      // package (jwt_decoder)

     final decodedToken =  JwtDecoder.decode(user!.token);       // method decode(token) dechiffre



     // je access to id dans this decodedToken
    //  print(decodedToken['id']);                   // return token


      // method : stock  token et id   dans stockage local sharedprefrences

      CacheHelper.saveData(
          key: ApiKey.token,
          value: user!.token ,
      );

      CacheHelper.saveData(
        key: ApiKey.id,
        value: decodedToken[ApiKey.id] ,
      );


      emit(SignInSuccessState());
      print(reponse);


    }on ServerException catch(e){
      emit(SignInErrorState(errorMessage: e.errorModel.errorMessage));



    }


  }


  // SignIn with repositories


  /*

  signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      email: signInEmail.text,
      password: signInPassword.text,
    );
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }






   */




// send request post signup


signUp() async {
  try {

    emit(SignUpLoadingState());
    final response = await api.post(

        EndPoint.signUp,
        isFromData: true, // car data sens sous form data pas json
        data: {

          ApiKey.name: signUpName.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.phone: signUpPhoneNumber.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.confirmPassword: confirmPassword.text,
          ApiKey
              .location: '{"key":"location","value":"{\"name\":\"methalfa\",\"address\":\"meet halfa\",\"coordinates\":[30.1572709,31.224779]}","type":"text"}',
          ApiKey.profilePic: await uploadImageToAPI(profilePic!),

        }


    );

    final SignUPModel = SignUpModel.fromJson(response);             // pour recive response dans model
    
    emit(SignUpSuccessState(message: SignUPModel.message));
  } on ServerException catch(e){
    
    emit(SignUpErrorState(errorMessage: e.errorModel.errorMessage));
    
    
  }
}


// send post request with repositories

  /*


  signUp() async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      name: signUpName.text,
      phone: signUpPhoneNumber.text,
      email: signUpEmail.text,
      password: signUpPassword.text,
      confirmPassword: confirmPassword.text,
      profilePic: profilePic!,
    );
    response.fold(
      (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }

   */




// method get

getUserProfile() async {

    try {
      final response = await api.get(

        EndPoint.getUserDataEndPoint(CacheHelper.getData(key: ApiKey.id)),


      );

      emit(GetUserSuccessState(user: UserModel.fromJson(response)));
    } on ServerException catch(e){

      emit(GetUserErrorState(errorMessage:e.errorModel.errorMessage ));


    }

}



// get data user with repositories

/*


 getUserProfile() async {
    emit(GetUserLoading());
    final response = await userRepository.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }

 */




}




































/*



La déclaration XFile? profilePic en Dart signifie que la variable profilePic est de type XFile, mais elle
 peut également être nulle (null), ce qui est indiqué par le point d'interrogation (?).
  Voici une explication plus détaillée :

XFile : Il s'agit d'un type de fichier utilisé dans Flutter, généralement associé à la gestion des fichiers.
Il est souvent utilisé en combinaison avec des packages comme image_picker ou file_picker
pour permettre à l'utilisateur de sélectionner des fichiers (par exemple, des images ou des vidéos) depuis l'appareil.

? (null safety) : Le point d'interrogation signifie que la variable peut contenir un fichier de type XFile
ou qu'elle peut être null. Cela est utile dans les cas où un fichier
 (comme une image de profil) n'est pas encore sélectionné, donc il est nécessaire de pouvoir
  laisser cette variable vide.

Cette déclaration est couramment utilisée lorsque l'application permet à l'utilisateur de choisir une image
 ou un fichier, et que cette sélection est optionnelle ou peut ne pas être encore faite.
 */












