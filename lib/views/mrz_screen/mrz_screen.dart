import 'package:flutter/material.dart';
import 'package:mrz_scanner/mrz_scanner.dart';



class MRZScaner extends StatefulWidget {
  @override
  State<MRZScaner> createState() => _MRZScanerState();
}

class _MRZScanerState extends State<MRZScaner> {
  final MRZController controller = MRZController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return MRZScanner(
          controller: controller,
          onSuccess: (mrzResult) async {
            await showDialog(
              context: context,
              builder: (context) => Dialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          controller.currentState?.resetScanning();
                        },
                        child: const Text('Reset Scanning'),
                      ),
                      Text('Name : ${mrzResult.givenNames}'),
                      Text('Gender : ${mrzResult.sex.name}'),
                      Text('CountryCode : ${mrzResult.countryCode}'),
                      Text('Date of Birth : ${mrzResult.birthDate}'),
                      Text('Expiry Date : ${mrzResult.expiryDate}'),
                      Text('DocNum : ${mrzResult.documentNumber}'),
                      Text('DocNum : ${mrzResult.documentType}'),
                      Text('surnames : ${mrzResult.surnames}'),
                      Text('nationalityCountryCode : ${mrzResult.nationalityCountryCode}'),
                      Text('personalNumber : ${mrzResult.personalNumber}'),
                      Text('personalNumber2 : ${mrzResult.personalNumber2}'),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}