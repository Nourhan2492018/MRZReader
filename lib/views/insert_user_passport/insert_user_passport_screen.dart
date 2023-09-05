import 'package:flutter/material.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/utils/date_time_class.dart';
import 'package:mrz_reader/utils/media_query.dart';
import 'package:mrz_reader/views/app_navigator.dart';
import 'package:mrz_reader/views/home/home.dart';
import 'package:mrz_reader/widgets/custom_button.dart';
import 'package:mrz_reader/widgets/custom_text_field.dart';
import 'package:mrz_reader/widgets/toast/enum.dart';
import 'package:mrz_reader/widgets/toast/toast.dart';
import 'package:provider/provider.dart';

import '../../providers/mrz/mrz_provider.dart';
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
  TextEditingController docTypeController=TextEditingController();
  TextEditingController countryCodeController=TextEditingController();
  TextEditingController surNameController=TextEditingController();
  bool isClickable=false;

  @override
  void initState() {
    // TODO: implement initState
    surNameController.text=context.read<MRZProvider>().mrzModel!.surName;

    countryCodeController.text=context.read<MRZProvider>().mrzModel!.countryCode;
    docTypeController.text=context.read<MRZProvider>().mrzModel!.documentType;
    nameController.text= context.read<MRZProvider>().mrzModel!.fullName;
    docNumController.text= context.read<MRZProvider>().mrzModel!.documentNumber;
    birthdateController.text= (context.read<MRZProvider>().mrzModel!.birthDate);
    expDateController.text= (context.read<MRZProvider>().mrzModel!.expiryDate);
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
    docTypeController.dispose();
    countryCodeController.dispose();
    surNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},
        icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: AppColors.primary,
        title:Text("Scan Passport Data ",style: TextStyle(fontSize: 18,color: Colors.white),),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,vertical: 16
            ),
            child: SingleChildScrollView(

              child: Column(
                children: [
                  Hero(
                    tag: "logo",
                    child: Image.asset(AppAssets.passportIcon,
                      color: AppColors.primary,  width: 80,
                      height: 80,),
                  ),
                const SizedBox(height: 16,),
                  CustomTextField(

                      isClickable: isClickable,
                      hintText: "Name",
                      controller: nameController, hint: 'Name',),
                 const  SizedBox(height: 12,),
                  CustomTextField(
                      hintText: 'surName', isClickable: isClickable,
                      hint: "surName",controller: surNameController),
                  const  SizedBox(height: 12,),
                  CustomTextField(hintText: "Doc Number",
                      isClickable: isClickable,
                      hint: '',controller: docNumController),
                  const  SizedBox(height: 12,),
                  CustomTextField(hint: "Doc Type", isClickable: isClickable,hintText: 'Doc Type',controller: docTypeController),
                  const  SizedBox(height: 12,),
                  CustomTextField(hint: '',
                  hintText: "Nationality Country", isClickable: isClickable,controller: nationalityController),
                  const  SizedBox(height: 12,),
                  CustomTextField(hint: "gender", isClickable: isClickable,
                      hintText: 'Gender',controller:genderController),
                  const  SizedBox(height: 12,),
                  CustomTextField(
                      hintText: 'BirthDate', isClickable: isClickable,
                      hint: "Birth Day",controller: birthdateController),
                  const  SizedBox(height: 12,),
                  CustomTextField(hint: "expiryDate", isClickable: isClickable,hintText: 'expiryDate',controller: expDateController),
                  const  SizedBox(height: 12,),

                  CustomButton(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    icon: !isClickable ?Icons.edit:Icons.edit_off,
                    iconColors: Colors.white,
                    width: context.width,
                    text: !isClickable?"Open Edit Date":"Close Edit Date",
                    backgroundColor: AppColors.primary,
                    fontSize: 16,
                    fontColor: Colors.white,
                    onPressed:()=>setState(() {
                      isClickable=!isClickable;
                    }),

                  ),
                  const  SizedBox(height: 8,),
                  CustomButton(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    icon: Icons.save_outlined,
                    iconColors: Colors.white,
                    width: context.width,
                    text: "Save Date",
                    backgroundColor: AppColors.primary,
                    fontSize: 16,
                    fontColor: Colors.white,
                    isLoading: context.watch<MRZProvider>().isLoading,
                    onPressed: ()=>_saveDate(),

                  ),

                ],
              ),
            ),
          ),
          if(context.watch<MRZProvider>().isLoading)
            Container(
            height: context.height,width: context.width,
            color: Colors.grey.withOpacity(0.5),
            alignment: Alignment.center,
            child:  Container(
              height: 50,width: 50,
              child: CircularProgressIndicator(

                backgroundColor: Colors.white,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
  _saveDate()
  async {
     context.read<MRZProvider>().mrzModel =MRZModel(documentType:docTypeController.text ,
         countryCode: countryCodeController.text, surName: surNameController.text,
         fullName: nameController.text, documentNumber: docNumController.text,
         nationalityCountryCode: nationalityController.text,
         birthDate: birthdateController.text, gender: genderController.text,
         expiryDate: expDateController.text, personalNumber:phoneNumController.text,
     personalNumber2: phoneNum2Controller.text);
     if(context.read<MRZProvider>().checkMRZExit())
     {
       ToastConfig.showToast(context: context,
           msg: "This Passport Already Saved ,\n The Same Document Number",
           toastStates: ToastStates.Warning);
     }

     else {
      bool result = await context.read<MRZProvider>().saveMRZ();
      if (result)
        ToastConfig.showToast(
            context: context,
            msg: "Date Saved successfully",
            toastStates: ToastStates.Success);
      else
        ToastConfig.showToast(
            context: context,
            msg: "Date Fail to Save",
            toastStates: ToastStates.Success);
      AppNavigator.customNavigator(
          context: context, screen: HomeScreen(), finish: true);
    }
  }
}
