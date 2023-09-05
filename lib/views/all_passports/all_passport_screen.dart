import 'package:flutter/material.dart';
import 'package:mrz_reader/providers/mrz/mrz_provider.dart';
import 'package:mrz_reader/utils/app_assets.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/utils/media_query.dart';
import 'package:mrz_reader/widgets/custom_cards/passport_card.dart';
import 'package:provider/provider.dart';

class AllPassportScreen extends StatefulWidget {
  const AllPassportScreen({Key? key}) : super(key: key);

  @override
  State<AllPassportScreen> createState() => _AllPassportScreenState();
}

class _AllPassportScreenState extends State<AllPassportScreen> {
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }
  Future<void>init() async {
    await context.read<MRZProvider>().getAllMRZ();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: AppColors.primary,
        title:const Text("All Passports Scan",style: TextStyle(fontSize: 18,color: Colors.white),),
      ),
      body: context.read<MRZProvider>().isLoading?
          Container(
            height: context.height,width: context.width,color: Colors.grey.withOpacity(0.5),
            child: CircularProgressIndicator(color: AppColors.primary),):
      Container(
        height: context.height*0.8,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child:
        context.read<MRZProvider>().mrzList.isEmpty?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.passportGif,height: context.height*0.2),
                const SizedBox(height: 16,),
                Text("Not Data Scan Yet",style: TextStyle(fontSize: 24,color: AppColors.primary),),

              ],
            )
            :
        ListView.builder(
          itemCount: context.read<MRZProvider>().mrzList.length,
          itemBuilder: (context, index) =>
            PassportCard(mrzModel: context.read<MRZProvider>().mrzList[index]),),
      ),
    );
  }
}
