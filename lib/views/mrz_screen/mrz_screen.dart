import 'package:flutter/material.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';
import 'package:mrz_reader/providers/mrz_provider.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/views/app_navigator.dart';
import 'package:mrz_reader/views/insert_user_passport/insert_user_passport_screen.dart';
import 'package:mrz_scanner/mrz_scanner.dart';
import 'package:provider/provider.dart';



class MRZScaner extends StatefulWidget {
  @override
  State<MRZScaner> createState() => _MRZScanerState();
}

class _MRZScanerState extends State<MRZScaner> {
  final MRZController controller = MRZController();
   bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Stack(
          children: [
            MRZScanner(
              controller: controller,
              onSuccess: (mrzResult) async {
                setState(() {
                  isLoading=true;
                });
                context.read<MRZProvider>().mrzModel=
                MRZModel(
                    documentType: mrzResult.documentType,
                    countryCode: mrzResult.countryCode,
                    surName: mrzResult.surnames, fullName: mrzResult.givenNames,
                    documentNumber: mrzResult.documentNumber,
                    nationalityCountryCode: mrzResult.nationalityCountryCode,
                    birthDate: mrzResult.birthDate,
                    gender: mrzResult.sex.name,
                    expiryDate: mrzResult.expiryDate,
                    personalNumber: mrzResult.personalNumber,
                personalNumber2: mrzResult.personalNumber2);
                setState(() {
                  isLoading=false;
                });
                AppNavigator.customNavigator(context: context,
                    screen: InsertUserPassportScreen(), finish: true);
                    // MRZModel(documentType: documentType,
                    //     countryCode: countryCode, surnames:
                    //     surnames, givenNames: givenNames,
                    //     documentNumber: documentNumber,
                    //     nationalityCountryCode: nationalityCountryCode,
                    //     birthDate: birthDate, sex: sex,
                    //     expiryDate: expiryDate, personalNumber: personalNumber);

                //await showDialog(
                //               context: context,
                //               builder: (context) => Dialog(
                //                 insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                //                 child: CircularProgressIndicator(
                //                   backgroundColor: AppColors.primary,
                //                   color: AppColors.primary,
                //                 ),
                //               ),
                //             );
              },
              showOverlay: true,
            ),
            if(isLoading)
              Container(color: Colors.transparent,
              child: CircularProgressIndicator(
                backgroundColor: AppColors.primary,
                color: AppColors.primary,
              )),

          ],
        );
      }),
    );
  }
}