import 'package:flutter/cupertino.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';

class MRZProvider extends ChangeNotifier{
MRZModel? _mrzModel;
List<MRZModel>? _mrzList;

MRZModel ?get mrzModel => _mrzModel;


set mrzModel(MRZModel ? mrzModel) {
    _mrzModel = mrzModel;
  }

  List<MRZModel> ?get mrzList => _mrzList;


}