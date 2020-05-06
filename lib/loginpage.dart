import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import ''

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((FirebaseUser user) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              SizedBox(height: 15.0),
              Text('Don\t have an account?'),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Sign up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
