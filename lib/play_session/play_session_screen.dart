import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../main_menu/main_menu_view.dart';

class PlaySessionScreen extends StatelessWidget {
  PlaySessionScreen({super.key});
  final player = AudioPlayer();

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
                                      // Volume Up
                                    }
                                ),
                                IconButton(
                                    icon: const Icon(Icons.volume_off),
                                    onPressed: () {
                                      // Volume Mute
                                    }
                                ),
                              ],
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
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Image.asset('assets/images/dirt.png', scale: 25),
                      onPressed: () {
                        FlameAudio.play('mc_dirt.wav');
                      }
                  ),
                  IconButton(
                      icon: Image.asset('assets/images/stone.png', scale: 25),
                      onPressed: ()  {
                        FlameAudio.play('mc_stone1.wav');
                      }
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/stone_cracked.png', scale: 25),
                    onPressed: () {
                      FlameAudio.play('mc_exp.wav');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
