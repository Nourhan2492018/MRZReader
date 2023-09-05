
import 'package:flutter/material.dart';
import 'package:mrz_reader/models/mrz/mrz_model.dart';
import 'package:mrz_reader/utils/app_assets.dart';
import 'package:mrz_reader/utils/app_color.dart';
import 'package:mrz_reader/widgets/custom_indictor.dart';
import 'package:provider/provider.dart';
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
            flex: 3,
            child:Image.asset(
              AppAssets.passportIcon,
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
        ],
      ),
    );
  }
}

class StatusContainer extends StatelessWidget {
  const StatusContainer({
    Key? key,
    required this.backgroundColor,
    required this.text,
  }) : super(key: key);
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      child: Container(
        width: 55,
        height: 20,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
