import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misteri_prasasti/win_game/win_game_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_menu/main_menu_view.dart';

class PlaySessionScreen extends StatelessWidget {
  PlaySessionScreen({super.key});
  final player = AudioPlayer();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  final RxBool isVolumeOn = true.obs;

  Future<void> checkVolumeStatus() async {
    isVolumeOn.value = _prefs.getBool('volume')!;
  }

  Widget generateGrid() {
    final List<String> images = ['assets/images/dirt.png', 'assets/images/stone.png', 'assets/images/stone_cracked.png'];
    List<Widget> gridItems = [];

    for (int i = 0; i < 6; i++) {
      List<Widget> rowItems = [];
      for (int j = 0; j < 6; j++) {
        final imageIndex = Random().nextInt(images.length);
        final imagePath = images[imageIndex];

        rowItems.add(StatefulBuilder(
            builder: (context, setState) => GestureDetector(
              onTap: () {
                if (imagePath == 'assets/images/stone.png' && isVolumeOn.isTrue) {
                  FlameAudio.play('mc_stone1.wav');
                } else if (imagePath == 'assets/images/stone_cracked.png' && isVolumeOn.isTrue) {
                  FlameAudio.play('mc_stone2.wav');
                } else {
                  if (isVolumeOn.isTrue) {
                    FlameAudio.play('mc_dirt.wav');
                  }
                }
                setState(() {
                  //delete the item
                });
              },
              child: Image.asset(imagePath, scale: 25),
            )
        ));
      }
      gridItems.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowItems,
      ));
    }
    return Column(
      children: gridItems,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Settings'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.volume_up),
                                    onPressed: () {
                                      // Volume On
                                      _prefs.setBool('volume', true);
                                    }
                                ),
                                IconButton(
                                    icon: const Icon(Icons.volume_off),
                                    onPressed: () {
                                      // Volume Mute
                                      _prefs.setBool('volume', false);
                                    }
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                runApp(const MaterialApp(
                                  home: WinGameScreen(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,
                              ),
                              child: const Text('Win Test'),
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  runApp(MaterialApp(
                                    home: MainMenuView(),
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Keluar'),
                            )
                          ],
                        ),
                      );
                    }
                );
              },
              icon: const Icon(Icons.settings)
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [Colors.deepPurpleAccent, Colors.deepPurple],
            radius: 0.69
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/game_bg.png'),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: generateGrid()
            )
          ],
        ),
      ),
    );
  }
}
