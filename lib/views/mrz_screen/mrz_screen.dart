import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';
import 'package:mrz_reader/providers/mrz/mrz_provider.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/utils/date_time_class.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Builder(builder: (context) {
        return Stack(
          children: [
            MRZScanner(
              controller: controller,
              onSuccess: (mrzResult) async {

                context.read<MRZProvider>().mrzModel=
                MRZModel(
                    documentType: mrzResult.documentType,
                    countryCode: mrzResult.countryCode,
                    surName: mrzResult.surnames, fullName: mrzResult.givenNames,
                    documentNumber: mrzResult.documentNumber,
                    nationalityCountryCode: mrzResult.nationalityCountryCode,
                    birthDate:DateTimeClass.fromDateToString(mrzResult.birthDate),
                    gender: mrzResult.sex.name,
                    expiryDate: DateTimeClass.fromDateToString(mrzResult.expiryDate),
                    personalNumber: mrzResult.personalNumber,
                personalNumber2: mrzResult.personalNumber2);

                AppNavigator.customNavigator(context: context,
                    screen: InsertUserPassportScreen(), finish: false);

              },

            ),

          ],
        );
      }),
    );
  }
}