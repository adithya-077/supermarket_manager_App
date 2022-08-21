import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_instagram_clone/models/product_models.dart';
import 'package:flutter_application_instagram_clone/models/user_models.dart';
import 'package:flutter_application_instagram_clone/provider/product_provider.dart';
import 'package:flutter_application_instagram_clone/screens/login_screen.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserDataModels> getUserinformation() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return UserDataModels.fromsnap(snap);
  }

  //delete product
  Future<void> deletedById(String id) async {
    await _firestore.collection('products').doc(id).delete();
    ProductProvider().updateProducts();
  }
  //show all products

  Future<List> getAllProducts() async {
    List products = [];
    await _firestore
        .collection('products')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((ele) {
              products.add(ele.data());
            }));

    return products;
  }

  //add products

  Future<String> addproducts(
      {required String productName,
      required String productUid,
      required String productQuantity}) async {
    String res = 'some error occured';
    try {
      if (productName.isNotEmpty ||
          productQuantity.isNotEmpty ||
          productUid.isNotEmpty) {
        Products newprod = Products(
            productName: productName,
            productQantity: productQuantity,
            productUid: productUid);

        await _firestore
            .collection('products')
            .doc(productUid)
            .set(newprod.tojson());

        res = 'done';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //logout

  void logOut(BuildContext context) async {
    _auth.signOut();
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  //sign up
  Future<String> signUpMethod({
    required String email,
    required String password,
    required String username,
    required String role,
    required int dpImgno,
    required String mbno,
  }) async {
    String res = 'some error occured ';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          role.isNotEmpty ||
          mbno.isNotEmpty) {
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserDataModels user = UserDataModels(
            userName: username,
            email: email,
            dpno: dpImgno,
            userUid: userCred.user!.uid,
            mbno: mbno,
            role: role);

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
