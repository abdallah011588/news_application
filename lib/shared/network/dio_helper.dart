
import 'package:dio/dio.dart';

class dioHelper {

  static late Dio dio ;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ),
    );
  }

 static Future<Response> getData({
  required String url,
  required Map<String,dynamic>? query,
  })async
  {
    return await dio.get(url,queryParameters: query,);
  }




}



//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca







