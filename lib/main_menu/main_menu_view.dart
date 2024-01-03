import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misteri_prasasti/main_menu/play_button_widget.dart';
import 'package:misteri_prasasti/main_menu/sign_in_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuView extends StatelessWidget {
  MainMenuView({super.key});
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  final RxBool isLoggedIn = false.obs;

  Future<void> checkLoginStatus() async {
    isLoggedIn.value = _prefs.containsKey('email');
  }

  @override
  Widget build(BuildContext context) {
    checkLoginStatus();
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
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: isLoggedIn.value ? const PlayButton() : SignInButton(),
          )
        ],
      ),
    ));
  }
}
