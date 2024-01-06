import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class PlaySessionScreen extends StatelessWidget {
  PlaySessionScreen({super.key});
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [Colors.deepPurple, Colors.deepPurpleAccent],
            radius: 0.75
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Game Test', textAlign: TextAlign.center),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
