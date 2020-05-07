import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('You are logged in'),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Logout'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacementNamed('/landing');
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Google Logout'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushReplacementNamed('/landing');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
