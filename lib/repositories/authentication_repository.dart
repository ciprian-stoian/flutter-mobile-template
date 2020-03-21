import 'dart:convert';
import 'dart:io';

import 'package:fluttermobiletemplate/handlers/headers_handler.dart';
import 'package:fluttermobiletemplate/models/user.dart';
import 'package:fluttermobiletemplate/utils/constants.dart';
import 'package:http/http.dart';

class AuthenticationRepository {
  Future<Response> register(User user) async {
    Response response;

    try {
      response = await post(
        REGISTER_PATH,
        headers: HeadersHandler.createBasicHeader(),
        body: json.encode(user),
      );
    } on SocketException catch (e) {
      return Response("", e.osError.errorCode);
    }

    return response;
  }
}
