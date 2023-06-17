import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../config/utility/routes.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  login(
      {required String email,
      required String password,
      required context}) async {
    emit(LoginLoadingState());
    var apiStatus = 'false';
    String url = 'http://aresha11-001-site1.ftempurl.com/api/Auth/token';
    http.Response response = await http
        .post(Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; char=UTF-8',
            },
            body: jsonEncode({'email': email, 'password': password}),)
        .then(
      (value) {


          print(value.statusCode);
          var body = json.decode(value.body);
          apiStatus = body['isAuthenticated'].toString();
          if (apiStatus == 'true') {
            emit(LoginSuccessState());
            SharedPreference.put(key: "login", value: "true");
            SharedPreference.put(key: "token", value: body["token"]);
            print(body["token"]);
            Navigator.pushNamed(context, AppRoutes.homeLayoutScreenRoute);
          }

        return value;
      },
    ).catchError((onError) {
      emit(LoginFailState());
      throw onError;
    });
  }
}
