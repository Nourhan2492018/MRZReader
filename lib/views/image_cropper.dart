import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ocr_sdk/flutter_ocr_sdk.dart';
import 'package:flutter_ocr_sdk/mrz_line.dart';
import 'package:flutter_ocr_sdk/mrz_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageCropper extends StatefulWidget {

  @override
  State<CustomImageCropper> createState() => _CustomImageCropperState();
}

class _CustomImageCropperState extends State<CustomImageCropper> {
  File? originalImage;
  File? croppedImage;
  FlutterOcrSdk _mrzDetector = FlutterOcrSdk();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton( onPressed: () async {
        //todo check for null safety
        File? file=await _captureAndCropImage();
        scanOCR(file!);
      }, child: Text("Scan"),),
    );
  }
  Future<File?> _captureAndCropImage() async {
    final picker = ImagePicker();
    final File pickedFile = (await picker.pickImage(source: ImageSource.camera)) as File; // You can change the source as needed

    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 3), // Adjust aspect ratio as needed
        compressQuality: 100, // Image quality
        maxWidth: 800, // Maximum image width
      );

      if (croppedFile != null) {
        setState(() {
          originalImage = File(pickedFile.path);
          croppedImage = croppedFile as File?;
        });
      return originalImage;
        // Now, you can pass 'originalImage' and 'croppedImage' to your MRZ library
        // For MRZ scanning, follow the documentation of your chosen MRZ library
      }
    }
  }
  Future<String> scanOCR(File photo) async {
    int? ret = await _mrzDetector.init(
        "DLS2eyJoYW5kc2hha2VDb2RlIjoiMjAwMDAxLTE2NDk4Mjk3OTI2MzUiLCJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSIsInNlc3Npb25QYXNzd29yZCI6IndTcGR6Vm05WDJrcEQ5YUoifQ==");

    List<List<MrzLine>>? results = await _mrzDetector.recognizeByFile(
        photo.path);
    String information = '';
    if (results != null && results.isNotEmpty) {
      for (List<MrzLine> area in results) {
        if (area.length == 2) {
          information =
              MRZ.parseTwoLines(area[0].text, area[1].text).toString();
        } else if (area.length == 3) {
          information = MRZ
              .parseThreeLines(area[0].text, area[1].text, area[2].text)
              .toString();
        }
      }
    }
    return information;
  }
}
