import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loginpage.dart';
import 'signuppage.dart';
import 'signinphone.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: LoginPage(), routes: <String, WidgetBuilder>{
      '/landing': (BuildContext context) => new MyApp(),
      '/signup': (BuildContext context) => new SignupPage(),
      '/home': (BuildContext context) => new HomePage(),
      '/phone': (BuildContext context) => new PhoneAuth(),
    });
  }
}
