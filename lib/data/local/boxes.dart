import 'package:hive/hive.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';
import 'package:mrz_reader/utils/app_constant.dart';


class Boxes {
  static Box<MRZModel> getMRZList() => Hive.box(AppConstants.hiveBoxName);
}
