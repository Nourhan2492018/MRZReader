import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrz_reader/views/home/home.dart';
import 'package:mrz_reader/views/splash/splash_screen.dart';
class AppRoot extends StatefulWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  State<AppRoot> createState() => _AppRootState();
}
class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
  @override
  Future<void> dispose() async {
    // TODO: implement dispose

    await Hive.close();
    super.dispose();
  }
}
