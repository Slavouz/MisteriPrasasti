import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/screens/main_screen.dart';

class SignInButton extends StatelessWidget {
  SignInButton({super.key});

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {
          _googleSignIn.signIn().then((user) {
            if (user?.displayName != null) {
              _prefs.setString('name', user!.displayName!);
              _prefs.setString('email', user.email);
              Get.snackbar('Success', 'Halo, ${user.displayName}');
            } else {
              Get.snackbar('Success', 'Halo, Player');
            }
          }).catchError((error) {
            Get.snackbar('Failed', 'Login Gagal');
            log('Auth Error: $error');
          });
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        child: const Text(
          'Continue with Google',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ));
  }
}
