import 'package:flutter/material.dart';
import 'package:mrz_reader/utils/app_assets.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/utils/media_query.dart';
import 'package:mrz_reader/views/all_passports/all_passport_screen.dart';
import 'package:mrz_reader/views/app_navigator.dart';
import 'package:mrz_reader/views/image_cropper.dart';
import 'package:mrz_reader/views/mrz_screen/mrz_screen.dart';
import 'package:mrz_reader/widgets/custom_cards/custom_card.dart';
import 'package:provider/provider.dart';

import '../../providers/mrz_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          const SizedBox(height: 64,),
          Hero(
            tag: "logo",
            child: Image.asset(AppAssets.passportIcon,
                color: AppColors.primary,  width: 80,
              height: 80,),
          ),
          Text("MRZ Reader",style: TextStyle(fontSize: 24,color: AppColors.primary),),
          const SizedBox(height: 32,),
          Row(
            children: [
              CustomCard(title: "All Passports",
                 imageUri:  AppAssets.folderIcon,
              onTap: () async {

                AppNavigator.customNavigator(context: context,
                    screen: const AllPassportScreen(), finish: false);

              }),
              CustomCard(title: "Scan Passport",
                  imageUri:  AppAssets.scannerIcon,
                  onTap: (){
                    AppNavigator.customNavigator(context: context, screen: MRZScaner(),
                        finish: false);

                  }),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(

                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 32),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),

                  ),
                  child:const   Text("The application will consists of three screens the first screen will have 2 buttons the first button will letyou scan the MRZ and go to the second screen witch will show the extracted data from the MRZincluding the image and button save to save the data into local storage.The second button will open the third screen which contains all stored or saved data from MRz",
                    style: TextStyle(fontSize: 12,color: Colors.white),),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
