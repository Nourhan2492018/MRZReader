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
bool checkMRZExit({required String documentNumber })
{
  return mrzMethods.checkMRZExit(documentNumber:documentNumber);

}

Future<bool> deleteMRZFromHive({required MRZModel mrzModel})
async {
  isLoading=true;
  notifyListeners();
  Future.delayed(const Duration(seconds: 4));
  bool result=await mrzMethods.deleteMRZFromHive(documentNumber:mrzModel.documentNumber);
  if(result)
    mrzList.remove(mrzModel);
  isLoading=false;
  notifyListeners();
  return result;
}

}