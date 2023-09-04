import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrz_reader/providers/mrz_provider.dart';
import 'package:mrz_reader/src/app_root.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor:Colors.transparent));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MRZProvider>.value(
        value: MRZProvider(),
      ),
    ],
      child: const AppRoot()));
}


