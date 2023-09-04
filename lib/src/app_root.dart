import 'package:flutter/material.dart';
import 'package:mrz_reader/views/home/home.dart';
import 'package:mrz_reader/views/mrz_screen/mrz_screen.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
