import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_instagram_clone/models/user_models.dart';
import 'package:flutter_application_instagram_clone/resources/store_image.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up
  Future<String> signUpMethod({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List dpImg,
  }) async {
    String res = 'some error occured ';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          dpImg != null) {
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photourl =
            await StoreImage().uploadImage('profilepics', dpImg, false);

        await _firestore.collection('users').doc(userCred.user!.uid).set({
          'username': username,
          'uid': userCred.user!.uid,
          'email': email,
          'followers': [],
          'following': [],
          'dpurl': photourl,
        });
        res = 'done';
      }
    } on FirebaseException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'email is badly formated';
      }
      if (err.code == 'weak-password') {
        res = 'enter a password with more than 6 characters';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //login
  Future<String> loginMethod(
      {required String email, required String password}) async {
    String res = 'error occured ';

    try {
      if (email.isNotEmpty || password.isEmpty) {
        UserCredential userCred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'done';
      } else {
        res = 'enter all credentials';
      }
    } on FirebaseException catch (err) {
      if (err.code == 'user-not-found') {
        res = 'no user with given credential';
      }
      if (err.code == 'wrong-password') {
        res = 'enter a correct  password ';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
