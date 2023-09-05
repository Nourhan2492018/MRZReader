import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrz_reader/providers/mrz_provider.dart';
import 'package:mrz_reader/src/app_root.dart';
import 'package:provider/provider.dart';

import 'models/mrz/mrz_model.dart';
import 'utils/app_constant.dart';
void main() async {
  await init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MRZProvider>.value(
        value: MRZProvider(),
      ),
    ],
      child: const AppRoot()));
}
Future<void>init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor:Colors.transparent));
  await Hive.initFlutter();
  Hive.registerAdapter(MRZModelAdapter());
  await Hive.openBox<MRZModel>(AppConstants.hiveBoxName);

}


