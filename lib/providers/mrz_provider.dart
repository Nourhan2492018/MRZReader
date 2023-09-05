import 'package:flutter/cupertino.dart';
import 'package:mrz_reader/data/local/mrz_mothods.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';

class MRZProvider extends ChangeNotifier{

MRZMethods mrzMethods= MRZMethods();
bool isLoading=false;
MRZModel? _mrzModel;
List<MRZModel> _mrzList=[];
MRZModel ?get mrzModel => _mrzModel;
List<MRZModel> get mrzList => _mrzList;
set mrzModel(MRZModel ? mrzModel) {
    _mrzModel = mrzModel;
  }


Future <bool> saveMRZ()async{
  isLoading=true;
  notifyListeners();
  Future.delayed(const Duration(seconds: 5));
  bool result =await mrzMethods.saveMRZToHive(mrzModel: _mrzModel!);
  isLoading=false;
  notifyListeners();
  return result;
}

getAllMRZ(){
  isLoading=true;
  notifyListeners();
  final list= mrzMethods.getAllMRZFromHive().values.toList();
  for(MRZModel mrzModel in list)
  {
    mrzList.add(mrzModel);
  }
  isLoading=false;
  notifyListeners();

}
bool checkMRZExit()
{
  return mrzMethods.checkMRZExit(documentNumber:_mrzModel!.documentNumber);

}


}