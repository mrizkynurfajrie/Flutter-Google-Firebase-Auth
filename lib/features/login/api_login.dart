import 'package:koffiesoft_test/framework/api.dart';

class ApiLogin {
  Future<dynamic> authentication({
    required String username,
    required String password,
  }) async {
    final payload = {
      "username": username,
      "password": password,
    };

    var r = await Api().apiJsonPostLogin('login', payload);
    return r;
  }
}
