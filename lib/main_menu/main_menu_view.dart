import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:misteri_prasasti/ui/screens/main_screen.dart';

class MainMenuView extends StatelessWidget {
  MainMenuView({super.key});
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey, Colors.red],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/logo_main_menu.png')),
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              onPressed: () {
                runApp(MainScreen());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                'PLAY',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              onPressed: () {
                _googleSignIn.signIn().then((user) {
                  if (user?.displayName != null) {
                    runApp(MainScreen());
                    Get.snackbar(
                        'Success',
                        'Halo, ${user!.displayName}'
                    );
                  } else {
                    Get.snackbar(
                        'Success',
                        'Halo, Player'
                    );
                  }
                }).catchError((error) {
                  Get.snackbar(
                      'Failed',
                      'Login Gagal'
                  );
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
              ),
              child: const Text(
                'Continue with Google',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
