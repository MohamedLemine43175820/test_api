abstract class ApiConsumer{                        //comme class Car

 Future<dynamic> get(
      String path ,{
        Object? data ,
        Map<String , dynamic>? queryParameters ,
  }
      );


 Future<dynamic> post(
      String path ,{
        Object? data ,
        Map<String , dynamic>? queryParameters ,

       bool isFromData = false,             // si body send sous formdata pas json
      }
      );


 Future<dynamic> patch(
      String path ,{
        Object? data ,
        Map<String , dynamic>? queryParameters ,

       bool isFromData = false ,             // si body send sous formdata pas json


      }
      );



 Future<dynamic> delete(
      String path ,{
        Object? data ,
        Map<String , dynamic>? queryParameters ,

       bool isFromData = false ,             // si body send sous formdata pas json
      }
      );
}





//components

// path : base url  required
// data : body  optinal
// queryParameters : optinal
// endPoints :
// headers :