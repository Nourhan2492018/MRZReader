import 'package:hive_flutter/adapters.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';

import 'boxes.dart';

class MRZMethods{

 Box<MRZModel> _mrzBox=Boxes.getMRZList();


 Future<bool> saveMRZToHive({required MRZModel mrzModel}) async {
  //
   await _mrzBox.put(mrzModel.documentNumber, mrzModel);
   print("Save fullName :${_mrzBox.get(mrzModel.documentNumber)!.fullName}");
  return checkMRZExit(documentNumber: mrzModel.documentNumber);
 }



 Future<bool> deleteMRZFromHive({required String documentNumber}) async {
   //
   await _mrzBox.delete(documentNumber);
   return checkMRZExit(documentNumber:  documentNumber)?false:true;
 }

 Box<MRZModel> getAllMRZFromHive()  {
  //
  return _mrzBox;
 }
 bool checkMRZExit({required String documentNumber})
 {
   if(_mrzBox.get(documentNumber)!=null)
     return true;
   return false;
 }
}