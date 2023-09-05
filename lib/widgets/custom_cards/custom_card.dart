import 'package:flutter/material.dart';
import 'package:mrz_reader/utils/app_color.dart';

class CustomCard extends StatelessWidget {

  final String imageUri;
  final String title;

  CustomCard({required this.title, required this.imageUri,this.onTap});

  void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color:AppColors.primary ,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(imageUri,color: Colors.white,height: 100,width: 80),

              Text(title,style: const TextStyle(color:  Colors.white,fontSize: 15),textAlign: TextAlign.center,),
              const SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}