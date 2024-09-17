class EndPoint {

  static String baseUrl = "https://food-api-omega.vercel.app/api/v1/";

  static String signIn = "user/signin";

  static String signUp = "user/signup";

  // methode pour send id with end point


  static String getUserDataEndPoint ( id)                       // id : pour user

  {


    return "user/get-user/$id";
  }




}

class  ApiKey {

  // cette  return si il a error dans signIn   model

  static String status = "status";                                // if i have error
  static String errorMessage = "ErrorMessage";

  // return si SignIn succes    model

  static String token = "token";
  static String message = "message";                //done

  static String id = "id";          // pour stock id apers dechiffre token




  // pour information user signUp

  // pour si on  utilise email and password dans request signin

  static String email = "email";
  static String password = "password";

  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";




}