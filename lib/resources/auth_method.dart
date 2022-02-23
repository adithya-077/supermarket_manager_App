import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_instagram_clone/models/user_models.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserDataModels> getUserinformation() async {
    User currentUser = _auth.currentUser!;
    // ignore: avoid_print
    print(currentUser.email);

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return UserDataModels.fromsnap(snap);
  }

  //sign up
  Future<String> signUpMethod({
    required String email,
    required String password,
    required String username,
    required String bio,
    required int dpImgno,
    required String mbno,
    required String dname,
  }) async {
    String res = 'some error occured ';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          dname.isNotEmpty ||
          mbno.isNotEmpty) {
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserDataModels user = UserDataModels(
            userName: username,
            dpName: dname,
            email: email,
            followers: [],
            following: [],
            dpno: dpImgno,
            userUid: userCred.user!.uid,
            mbno: mbno,
            bio: bio);

        await _firestore
            .collection('users')
            .doc(userCred.user!.uid)
            .set(user.toJson());

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
        await _auth.signInWithEmailAndPassword(
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
