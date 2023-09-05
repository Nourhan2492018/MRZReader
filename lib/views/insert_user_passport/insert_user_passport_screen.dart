import 'package:flutter/material.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/utils/date_time_class.dart';
import 'package:mrz_reader/utils/media_query.dart';
import 'package:mrz_reader/widgets/custom_button.dart';
import 'package:mrz_reader/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../providers/mrz_provider.dart';
import '../../utils/app_assets.dart';

class InsertUserPassportScreen extends StatefulWidget {

  @override
  State<InsertUserPassportScreen> createState() => _InsertUserPassportScreenState();
}

class _InsertUserPassportScreenState extends State<InsertUserPassportScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController docNumController=TextEditingController();
  TextEditingController nationalityController=TextEditingController();
  TextEditingController birthdateController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController issueDateController=TextEditingController();
  TextEditingController expDateController=TextEditingController();
  TextEditingController phoneNumController=TextEditingController();
  TextEditingController phoneNum2Controller=TextEditingController();
  TextEditingController docType=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    docType.text=context.read<MRZProvider>().mrzModel!.documentType;
    nameController.text= context.read<MRZProvider>().mrzModel!.fullName;
    docNumController.text= context.read<MRZProvider>().mrzModel!.documentNumber;
    birthdateController.text= DateTimeClass.fromDateToString(context.read<MRZProvider>().mrzModel!.birthDate);
    expDateController.text= DateTimeClass.fromDateToString(context.read<MRZProvider>().mrzModel!.expiryDate);
    phoneNumController.text= context.read<MRZProvider>().mrzModel!.personalNumber;
    phoneNum2Controller.text= context.read<MRZProvider>().mrzModel!.personalNumber2??"No anther personal number ";
    nationalityController.text=context.read<MRZProvider>().mrzModel!.nationalityCountryCode;
    genderController.text=context.read<MRZProvider>().mrzModel!.gender;
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    phoneNumController.dispose();
    phoneNum2Controller.dispose();
    birthdateController.dispose();
    genderController.dispose();
    nationalityController.dispose();
    docNumController.dispose();
    expDateController.dispose();
    docType.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
             Container(
               margin: const EdgeInsets.only(top: 64),
                child:  Image.asset(AppAssets.passportIcon,
                    color: AppColors.primary),
              width: 80,
              height: 80,
            ),

            Text("Passport Data",style: TextStyle(fontSize: 24,color: AppColors.primary),),
            const  SizedBox(height: 32,),
            CustomTextField(
                hintColor: AppColors.primary,
                hintText: "Name",
                controller: nameController, hint: 'Name',),
           const  SizedBox(height: 12,),
            CustomTextField(hintText: "Doc Number",
                hint: '',controller: docNumController),
            const  SizedBox(height: 12,),
            CustomTextField(hint: "Doc Type",hintText: 'Doc Type',controller: docType),
            const  SizedBox(height: 12,),
            CustomTextField(hint: '',
            hintText: "Nationality Country",controller: nationalityController),
            const  SizedBox(height: 12,),
            CustomTextField(hint: "Sex",
                hintText: 'Gender',controller:genderController),
            const  SizedBox(height: 12,),
            CustomTextField(
                hintText: 'BirthDate',
                hint: "Birth Day",controller: birthdateController),
            const  SizedBox(height: 12,),
            CustomTextField(hint: "expiryDate",hintText: 'expiryDate',controller: expDateController),
            const  SizedBox(height: 12,),
            CustomButton(
              padding: const EdgeInsets.symmetric(vertical: 10),
              icon: Icons.save_outlined,
              iconColors: Colors.white,
              width: context.width,
              text: "Save Date",
              backgroundColor: AppColors.primary,
              fontSize: 16,
              fontColor: Colors.white,
              onPressed: _saveDate(),

            ),

          ],
        ),
      ),
    );
  }
  _saveDate()
  {}
}
