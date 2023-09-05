import 'package:flutter/material.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/utils/media_query.dart';
import 'package:mrz_reader/views/app_navigator.dart';
import 'package:mrz_reader/views/home/home.dart';
import 'package:provider/provider.dart';

import '../../utils/app_assets.dart';
class SplashScreen extends StatefulWidget  {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {


  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 4000),
    vsync: this,
  )..forward().then((value) => startAnimation());
  late final AnimationController _logoController = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );
  late final Animation<Offset> _offsetLeafAnimation = Tween<Offset>(
    end: Offset.zero,
    begin: Offset((context.width*0.06), 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  ));
  late final Animation<Offset> _offsetRightAnimation = Tween<Offset>(
    end: Offset.zero,
    begin: Offset(-(context.width*0.06), 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  ));
  late final Animation<Offset> _offsetLogoAnimation = Tween<Offset>(
    end: Offset.zero,
    begin: Offset(0, -(context.height*0.02)),
  ).animate(CurvedAnimation(
    parent: _logoController,
    curve: Curves.bounceOut,
  ));
  void startAnimation() async {
    // Start Animation of logo
    await _logoController.forward();
    await Future.delayed(const Duration(seconds: 4));
    AppNavigator.customNavigator(context: context, screen:const  HomeScreen(), finish: true);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [

          Container(width: double.infinity,height: double.infinity,
          color: Colors.white,),
          Center(
            child: SlideTransition(
              position: _offsetLogoAnimation,
              child: Hero(tag: 'logo',
                  child: Image.asset(AppAssets.passportIcon,height: 100,width: 100,color: AppColors.primary,)),
            ),
          ),
          Positioned(bottom: 64 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _offsetLeafAnimation,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 15,width: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: AppColors.primary
                      ),),
                  ),
                  Text("MRZ Reader",
                    style: TextStyle(fontSize: 28,fontWeight:FontWeight.normal,color:
                    AppColors.primary),
                  ),
                  SlideTransition(
                    position:_offsetRightAnimation,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 15,width: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: AppColors.primary
                      ),),
                  ),
                ],
              )),
        ],
      ),
    );
  }

}
