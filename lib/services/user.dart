import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class User {
  storeUser(user, context) {
    Firestore.instance.collection('/users').add({
      'uid': user.uid,
      'email': user.email,
      'password': user.password
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e) {
      print(e);
    });
  }
}
