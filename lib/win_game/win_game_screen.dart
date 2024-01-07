import 'dart:math';

import 'package:flutter/material.dart';
import 'package:misteri_prasasti/play_session/play_session_screen.dart';
import 'package:misteri_prasasti/prasasti/prasasti.dart';

class WinGameScreen extends StatelessWidget {
  const WinGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final randomPrasasti = prasastiList[Random().nextInt(prasastiList.length)];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              randomPrasasti.nama,
              style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8.0),
          Image.network(
              randomPrasasti.imgUrl,
            width: 200,
            height: 400,
          ),
          const SizedBox(height: 8.0),
          Text(
            randomPrasasti.desc,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              runApp(MaterialApp(
                home: PlaySessionScreen(),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white
            ),
            child: const Text('Lanjutkan'),
          )
        ],
      )
    );
  }
}
