import 'package:either_dart/either.dart';
import 'package:project/data/datasource/datasource_auth.dart';
import 'package:project/gitit/gitit.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(String email, String password, String confirmPassword, String name);
  Future<Either<String, String>> login(String email, String password);
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticationDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> login(String email, String password) async {
    try {
      String token = await _datasource.login(email, password);
      if (token.isNotEmpty) {
        return Right('login');
      } else {
        return Left('Error');
      }
    } catch (e) {
      print(e);
      return Left('Error'); // Ensure a value is always returned
    }
  }

  @override
  Future<Either<String, String>> register(String email, String password, String confirmPassword, String name) async {
    try {
      await _datasource.register(email, password, confirmPassword, name);
      return Right('Done');
    } catch (e) {
      print(e);
      return Left('Error'); // Ensure a value is always returned in case of an error
    }
  }
}
