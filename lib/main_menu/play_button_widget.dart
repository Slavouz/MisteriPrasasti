import 'package:flutter/material.dart';

import '../ui/screens/main_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        runApp(const MaterialApp(
          home: MainScreen(),
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