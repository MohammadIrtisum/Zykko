import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meassage_app/screen/singup_screen.dart';

class AuthMathod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // user singup 
  Future<String> singUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async{
    String res = "Some error occured";
    try {
      // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // res = "Success";
      if( email.isNotEmpty  & email.contains("@") ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          file != null           ) {
            // register user
       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(userCredential.user!.uid);
        // add user to database
        await _firestore.collection("users").doc(userCredential.user!.uid).set({
          "username": username,
          "email":email,
          "uid": userCredential.user!.uid,
          "followers": [],
          "following": [],
        });
        res = "Success";
      } else {
        // Here you would typically upload the file and create a user in your database
        // For now, we will just return a success message
        res = "User created successfully";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
    
  }
}
