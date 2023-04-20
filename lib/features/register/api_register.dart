import 'package:koffiesoft_test/framework/api.dart';

class ApiRegister {
  Future<dynamic> createUsers({
    required String email,
    required String hp,
    required String firstname,
    required String lastname,
    required String grup,
    required String tglLahir,
    required int jenisKelamin,
    required String password,
    required bool strictPassword,
  }) async {
    final payload = {
      "email": email,
      "hp": hp,
      "firstname": firstname,
      "lastname": lastname,
      "grup": grup,
      "tgl_lahir": tglLahir,
      "jenis_kelamin": jenisKelamin,
      "password": password,
      "strict_password": strictPassword,
    };
    var r = await Api().apiJsonPost("users", payload);

    return r;
  }
}
