import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CupertinoTextFieldDemo(),
    );
  }
}
// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

class CupertinoTextFieldDemo extends StatelessWidget {
  var email;
  var password;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
        child: ListView(
          restorationId: 'text_field_demo_list_view',
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                restorationId: 'email_address_text_field',
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                clearButtonMode: OverlayVisibilityMode.editing,
                autocorrect: false,
                onChanged: (value){
                  email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                restorationId: 'login_password_text_field',
                placeholder: 'Password',
                clearButtonMode: OverlayVisibilityMode.editing,
                obscureText: true,
                autocorrect: false,
    onChanged: (value) {
      password = value;
    }
              ),
            ),
            FlatButton.icon(
                onPressed: () {
                  print(email);
                  print(password);
                  SignUp(email, password);
                },
                icon: Icon(Icons.save),
                label: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}

SignUp(email, password)async{
  var url = 'http://localhost:1337';
  final response = await http.post(
   url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email, 'password': password,
    }),
  );

  if (response.statusCode == 201) {
  } else {
    throw Exception('Failed to create album.');
  }
}
