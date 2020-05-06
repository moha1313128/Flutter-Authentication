import 'package:authentication/services/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _name;
  String _email;
  String _password;
  String _confirmPassword;
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
                decoration: InputDecoration(hintText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 15.0),
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
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(hintText: 'Confirm Password'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _confirmPassword = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  child: Text('Sign up'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                    //   FirebaseAuth.instance
                    //       .createUserWithEmailAndPassword(
                    //           email: _email, password: _password)
                    //       .then((signedInUser) {
                    //     User().storeUser(signedInUser, context);
                    //     Navigator.of(context).pushReplacementNamed('/home');
                    //   }).catchError((e) {
                    //     print(e);
                    //   });
                    // },

                    if (_password == _confirmPassword) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((user) {
                        Firestore.instance
                            .collection('user')
                            .document(user.uid)
                            .setData({
                          'uid': user.uid,
                          'name': user.displayName,
                          'email': user.email
                        }).then((result) => {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home'),
                                });
                      }).catchError((e) {
                        print(e);
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('The passwords do not match'),
                              actions: <Widget>[
                                FlatButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                          });
                    }
                  }),
              SizedBox(height: 15.0),
              Text('Already have an account?'),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
