import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../widgets/loginInput.dart';
import './blogsScreen.dart';
import '../providers/token.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  var body;

  getToken() async {
    Uri url =
        Uri.parse('https://60585b2ec3f49200173adcec.mockapi.io/api/v1/login');
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };

    http.Response response = await http.post(
      url,
      headers: headers,
    );
    body = jsonDecode(response.body);
    print(body["token"]);

    final tokenData = Provider.of<Token>(context, listen: false);
    tokenData.setToken(body["token"]);

    Navigator.of(context).pushReplacementNamed(BlogsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Homeward.co'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: deviceSize.width * 0.1,
          right: deviceSize.width * 0.1,
          top: deviceSize.height * 0.3,
        ),
        child: Column(
          children: [
            LoginInput('email', (input) {
              email = input;
            }),
            LoginInput('password', (input) {
              password = input;
            }),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: getToken,
            ),
          ],
        ),
      ),
    );
  }
}
