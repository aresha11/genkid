import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:genkid/config/data/shared/dio_helper.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  DioHelper dioHelper =DioHelper();

  bool? privacyAcceptance;

  var apiStatus;

  var token;
  register({

    required String firstName,
    required String userName,
    required String email,
    required String password,
    required int age,
    required context,

  })async{
    String url = 'http://osama121220-001-site1.btempurl.com/api/Auth/register';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
      body: jsonEncode(
        {
          "firstName": firstName,
          "userName": userName,
          "email": email,
          "password": password,
          "age": age,
        },
      ),
    ).then((value) {
      print(value.body);
      var body = json.decode(value.body);
      print(body);
      apiStatus = body['isAuthenticated'].toString();
      if(value.statusCode==200){
        token = body['token'].toString();
      }
      print(value.statusCode);
      print(token);
      return value;
    });

  }











}
