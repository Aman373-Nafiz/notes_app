// data/repositories/auth_repository.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthRepository extends GetxController {
  var success = false.obs;
  RxBool isLoggedIn = false.obs; // Observable to track login status
  RxBool isLoading = true.obs;
  Future<bool> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      success.value = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return success.value;
  }

  Future<bool> register(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      success.value = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return success.value;
  }
   Future<void> checkLoginStatus() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    this.isLoggedIn.value = isLoggedIn ?? false;
    isLoading.value = false;
  }

  Future<void> login() async {
    // Handle login logic and save the state
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    isLoggedIn.value = true;
  }

  Future<void> logout() async {
    // Handle logout logic and clear the state
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    isLoggedIn.value = false;
  }
}
