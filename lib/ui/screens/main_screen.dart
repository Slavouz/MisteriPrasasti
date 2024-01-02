// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:misteri_prasasti/ui/theme/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Misteri Prasasti"),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.settings),
            ),
          ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage
                ('assets/images/concept.png'),
              fit: BoxFit.cover,
              ),
              color: AppColor.lightPrimaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.flag,
                  color: AppColor.accentColor, 
                  size: 34.0,
                  ),
              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}