import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../model/user.dart';
import '../server.dart';

class UserCRUD {
  static addUser(Person user) async {
    try {
      Map<String, dynamic> body = {
        'id': user.id,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'name': user.username,
        'age': user.age,
        'bio': user.bio,
        'phoneNo': user.phoneNo,
        'image': user.image,
        'status': user.status,
      };
      var response = await Dio()
          .post(server + 'addUser.php', data: FormData.fromMap(body));
      // print(response);
      return response;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static fetchUser(String id) async {
    Map<String, dynamic> body = {
      'id': id,
    };

    Response response =
        await Dio().post(server + 'readUser.php', data: FormData.fromMap(body));
    var data = jsonDecode(response.data);
    // print(data[0]);
    return data[0];
  }
}
