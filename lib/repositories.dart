//

import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/function/upload_image_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/signIn_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/signup_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// dartZ cette package pour methode return plusieurs return type

class UserRepository {

  final ApiConsumer api ;

  UserRepository({required this.api});

  // method sign in

  Future<Either<String , SignInModel>> SignIn ({                              //<lift and right >

    required String email ,
    required String password,

}) async{

    try {

      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token);
      CacheHelper.saveData(key: ApiKey.token, value: user.token);
      CacheHelper.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }


  }


  // method sign up


  Future<Either <String, SignUpModel>> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required XFile profilePic,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,

        data: {
          ApiKey.name: name,
          ApiKey.phone: phone,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
          ApiKey.location:
          '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.profilePic: await uploadImageToAPI(profilePic)
        },
      );
      final signUPModel = SignUpModel.fromJson(response);

      return Right(signUPModel);

    } on ServerException catch (e) {

      return Left(e.errorModel.errorMessage);
    }
  }

  // method get user data

  Future<Either<String, UserModel>> getUserProfile() async {

    try {
      final response = await api.get(
        EndPoint.getUserDataEndPoint(
          CacheHelper.getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }



}

// NB: POUR use methode in Cubit



//  1.  final UserRepository userRepository;   declare var de type  UserRepository
// 2.  UserCubit(this.userRepository) : super(UserInitial());      passe to constructor


// 3.use methode dans  UserCubit

// 4.  UserCubit(UserRepository(api: DioConsumer(dio: Dio()))), passe a cubit dans main