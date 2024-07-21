import 'package:dio/dio.dart';

class DioProvider{
  static Dio createDioWithoutHeader(){
    Dio dio = Dio(BaseOptions(baseUrl:"http://localhost:5000"));
    return dio;
  }
}