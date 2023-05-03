import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Data extends ChangeNotifier{
var firstName,lastName,email,password,username,age,telephone,apiStatus,phone,token;
bool? privacyAcceptance;
register()async{
  String url = 'http://hellana-001-site1.atempurl.com/api/Auth/register';
  http.Response response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; char=UTF-8',
    },
    body: jsonEncode(
      {
        'FirstName': firstName,
        'LastName':lastName,
        'Email': email,
        'Password': password,
        'Telephone': telephone,
        'Age': age,
        'userName': username,

      },
    ),
  );
  var body = json.decode(response.body);
  apiStatus = body['isAuthenticated'].toString();
  if(apiStatus==true){
    token = body['token'].toString();
  }
  print(body);

}
login() async {
  apiStatus = 'false';
  String url = 'login/student';
  http.Response response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
      body: jsonEncode({'email': email, 'password': password}));
  var body = json.decode(response.body);
  apiStatus = body['isAuthenticated'].toString();
  if (apiStatus == 'true') {
    email = body['data']['email'];
    username = body['data']['username'].toString();
  }
}
}