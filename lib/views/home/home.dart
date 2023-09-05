import 'package:flutter/material.dart';
import 'package:mrz_reader/utils/app_assets.dart';
import 'package:mrz_reader/views/app_navigator.dart';
import 'package:mrz_reader/views/image_cropper.dart';
import 'package:mrz_reader/widgets/CustomCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 200,
                width: 200,

                child: GestureDetector(
                  child: CustomCard("Click to scan a new passport", AppAssets.scannerIcon),
                  onTap: () {
                    AppNavigator.customNavigator(
                        context: context, screen: CustomImageCropper(), finish: false);
                  },
                )),
          ),
        ],
      ),
    );
  }
}
