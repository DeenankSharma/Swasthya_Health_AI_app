import 'package:dio/dio.dart';
import 'package:project/utils/Auth_Manager.dart';
import 'package:project/utils/dio.dart';

abstract class IAuthenticationDatasource {
  Future<void> register(
      String Email, String Password, String ConfirmPassword, String name);
  Future<String> login(String Email, String Password);
}

class AuthenticationRemote extends IAuthenticationDatasource {
  @override
  final Dio _dio = DioProvider.createDioWithoutHeader();
  Future<String> login(String Email, String Password) async {
    try {
      final response = await _dio.post('/', data: {
        'email': Email,
        // 'username':name,
        'password': Password,
        // 'passwordConfirm':ConfirmPassword
      });
      if (response.statusCode == 200) {
        AuthManager.saveToken(response.data?['token']);
        return response.data?['token'];
      }
    } catch (e) {
      print(e);
    }
    return '';
  }

  @override
  Future<void> register(String Email, String Password, String ConfirmPassword,
      String name) async {
    try {
      final response = await _dio.post('/', data: {
        'email': Email,
        'username': name,
        'password': Password,
        'passwordConfirm': ConfirmPassword
      });
      if (response.statusCode == 200) {
        login(Email, Password);
      }
    } catch (e) {
      print(e);
      {}
    }
  }
}
