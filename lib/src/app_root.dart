import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';
import 'package:mrz_reader/utils/app_constant.dart';
import 'package:mrz_reader/views/home/home.dart';
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
      home: HomeScreen(),
    );
  }
  @override
  Future<void> dispose() async {
    // TODO: implement dispose

    await Hive.close();
    super.dispose();
  }
}
