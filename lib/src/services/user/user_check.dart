import 'dart:convert';

import 'package:dio/dio.dart';

import '../server.dart';

class UserCheck {
  static userExists(String id) async {
    Map<String, dynamic> body = {
      'id': id,
    };

    Response response = await Dio()
        .post(server + 'userExists.php', data: FormData.fromMap(body));
    print(response.data);
    var data = jsonDecode(response.data);
    print(data[0]);
    return data[0];
  }
}
