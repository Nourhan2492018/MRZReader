import 'package:flutter/material.dart';
import 'package:mrz_reader/views/app_navigator.dart';
import 'package:mrz_reader/views/mrz_screen/mrz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: () {
            AppNavigator.customNavigator(context: context,
                screen: MRZScaner(), finish: false);
          }, child:  Text("Scan")),
        ],
      ),
    );
  }
}
