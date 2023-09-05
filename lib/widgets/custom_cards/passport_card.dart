
import 'package:flutter/material.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';
import 'package:mrz_reader/providers/mrz/mrz_provider.dart';
import 'package:mrz_reader/utils/app_assets.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/widgets/custom_indictor.dart';
import 'package:mrz_reader/widgets/toast/toast.dart';
import 'package:provider/provider.dart';

import '../toast/enum.dart';
class PassportCard extends StatefulWidget {
  final Color? color;
  final MRZModel mrzModel;

  const PassportCard({
    Key? key,
    // this.text,
    this.color,
    required this.mrzModel,
  }) : super(key: key);

  @override
  State<PassportCard> createState() => _PassportCardState();
}

class _PassportCardState extends State<PassportCard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 140.0,
      margin: const EdgeInsets.only(
        top: 10.0,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        border: Border.all(
          color:  Colors.grey[300]!,
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child:Image.asset(
              AppAssets.passportIcon,
              fit: BoxFit.fill,
              color:   AppColors.primary.withOpacity(0.5),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                color:  AppColors.primary.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Microfiber Towel' * 10,
                      widget.mrzModel.fullName!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith( color: AppColors.primary),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(

                      "${widget.mrzModel.surName??""}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 8.0,
                          ),
                    ),
                    // const SizedBox(
                    //   height: 8.0,
                    // ),
                    Spacer(),
                    Text(
                      // 'Ultra-absorbent microfiber hand towel in good state.',
                      "${widget.mrzModel.documentNumber??""}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12.0,
                        color: AppColors.primary
                          ),
                    ),
                    Spacer(),
                    Text(
                      '${widget.mrzModel.countryCode??""}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                size: 16.0,
                                Icons.data_exploration_outlined,
                                color: AppColors.primary,

                                // color: AppColors.lightGrey,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Flexible(
                                child: Text("${widget.mrzModel.expiryDate}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                size: 16.0,
                                Icons.timelapse,
                                color: AppColors.primary,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Flexible(
                                child: Text(
                                  "${widget.mrzModel.birthDate}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 10.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          GestureDetector(
            child: Container(
              width: 40,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                color: Colors.red.withOpacity(0.6),
                borderRadius:const  BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),

              ),
              child:const  Icon(Icons.delete,size: 24,color: Colors.white),
            ),
            onTap:() {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.white,

                  title: Text(
                    "Are You Sure",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!.copyWith(color: AppColors.primary),
                  ),
                  content: Text(
                    "do You Want delete document number : ${widget.mrzModel.documentNumber}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!.copyWith(color: AppColors.primary),
                  ),

                  // actionsAlignment: MainAxisAlignment.center,
                  actions: [

                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(false);
                      },
                      child: Text(
                        "cancel",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!.copyWith(
                          fontSize: 16,
                          color: Colors.redAccent

                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: ()async {

                        _deleteMRZ();
                        Navigator.of(context)
                            .pop(true);
                      },
                      child: Text(
                        "confirm",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!.copyWith(
                          fontSize: 16,
                          color: Colors.green
                          //    color: AppColors.yellow
                        ),

                      ),
                    ),
                  ],
                ),
              );
            } ,
          ),

        ],
      ),
    );
  }

  Future<void> _deleteMRZ()
  async {
    if( !context.read<MRZProvider>().checkMRZExit(documentNumber: widget.mrzModel.documentNumber ))
      {
        ToastConfig.showToast(context: context,
            msg: "This Passport Don't Exits ",
            toastStates: ToastStates.Warning);
      }
    else
    {
      bool res=await context.read<MRZProvider>().deleteMRZFromHive(mrzModel:
      widget.mrzModel);
      if(res)
        ToastConfig.showToast(context: context,
            msg: "This Passport Deleted Successfully",
            toastStates: ToastStates.Success);
      else
        ToastConfig.showToast(context: context,
            msg: "This Passport Fail Delete ",
            toastStates: ToastStates.Error);


    }

  }
}



