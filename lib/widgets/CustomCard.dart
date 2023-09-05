import 'package:flutter/material.dart';
import 'package:mrz_reader/utils/app_color.dart';

class CustomCard extends StatelessWidget {

  String imageUri,title;


  CustomCard(this.title,this.imageUri, );

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primary,
      elevation: 40,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CircleAvatar(child: Image.asset(imageUri,),radius: 40,backgroundColor: Colors.transparent),
          ),
          Text(title,style: TextStyle(color: AppColors.primary,fontSize: 15),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}