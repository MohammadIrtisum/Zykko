import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meassage_app/resources/storage_method.dart';
import 'package:meassage_app/screen/signUp/sign_up.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // user singup 
  Future<String> singUpUser({
    required String email,
    required String password,
    required String username,
    // required Uint8List file,
  }) async{
    String res = "Some error occured";
    try {
      // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // res = "Success";
      // if( email.isNotEmpty  ||
      //     password.isNotEmpty ||
      //     username.isNotEmpty  
      //     // file !=null
      //       ) {
      //       // register user
      //  UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      //     email: email,
      //     password: password,
      //   );
      //   print(userCredential.user!.uid);

      //   // String profilePicUrl = await StorageMethod().uploadImageToStorage("profilePic", file, false);
      //   // add user to database
      //   await _firestore.collection("users").doc(userCredential.user!.uid).set({
      //     "username": username,
      //     "email":email,
      //     "uid": userCredential.user!.uid,
      //     "followers": [],
      //     "following": [],
      //     // "profilePic": profilePicUrl,
      //   });
      //   res = "Success";
      // } else {
      //   // Here you would typically upload the file and create a user in your database
      //   // For now, we will just return a success message
      //   res = "User created successfully";
      // }
      if(email.isEmpty || password.isEmpty || username.isEmpty){
        return "Please fill in all fields";
      }
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
       print(cred.user!.uid);
       
      await _firestore.collection("users").doc(cred.user!.uid).set({
        "username": username,
        "email": email,
        "uid": cred.user!.uid,
        "createdAt": FieldValue.serverTimestamp(),
        "followers": [],
        "following": [],
      });
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
    
  }
  // user login
  Future<String> loginUser({
    required String email ,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if(email.isEmpty || password.isEmpty){
        return "Please fill in all fields";
      }
      await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
        );
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
  // user logout
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}


final authMethodProvider = Provider<AuthMethod>((ref) {
  return AuthMethod();
});
