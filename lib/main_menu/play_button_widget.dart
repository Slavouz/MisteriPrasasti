import 'package:flutter/material.dart';
import 'package:misteri_prasasti/play_session/play_session_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        runApp(MaterialApp(
          home: PlaySessionScreen(),
        ));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      ),
      child: const Text(
        'PLAY',
        textAlign: TextAlign.center,
      ),
    );
  }
}