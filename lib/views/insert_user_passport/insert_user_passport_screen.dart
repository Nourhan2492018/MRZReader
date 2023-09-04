import 'package:flutter/material.dart';
import 'package:mrz_reader/widgets/app_color.dart';
import 'package:mrz_reader/widgets/custom_textfield.dart';

import '../../utils/app_assets.dart';

class InsertUserPassportScreen extends StatefulWidget {
  TextEditingController nameController=TextEditingController();
  TextEditingController docNumController=TextEditingController();
  TextEditingController nationalityController=TextEditingController();
  TextEditingController birthdateController=TextEditingController();
  TextEditingController sexController=TextEditingController();
  TextEditingController issueDateController=TextEditingController();
  TextEditingController expDateController=TextEditingController();
  TextEditingController phoneNumController=TextEditingController();
  @override
  State<InsertUserPassportScreen> createState() => _InsertUserPassportScreenState();
}

class _InsertUserPassportScreenState extends State<InsertUserPassportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Image.asset(AppAssets.passportIcon,
                    color: AppColors.primary),
              width: 20,
              height: 20,
            ),
            Text("Passport",style: TextStyle(fontSize: 20,color: AppColors.primary),),
            CustomTextField(hint: "Name",isEdit: false,isLabel: true,controller: widget.nameController),
            CustomTextField(hint: "Doc Number",isEdit: false,isLabel: true,controller: widget.docNumController),
            CustomTextField(hint: "Nationality",isEdit: false,isLabel: true,controller: widget.nationalityController),
            CustomTextField(hint: "Sex",isEdit: false,isLabel: true,controller: widget.sexController),
            CustomTextField(hint: "Estimated Issuing date",isEdit: false,isLabel: true,controller: widget.issueDateController),
            CustomTextField(hint: "Phone number",isEdit: false,isLabel: true,controller: widget.phoneNumController),
            Row(

              children: [

              ],
            ),
          ],
        ),
      ),
    );
  }
}
