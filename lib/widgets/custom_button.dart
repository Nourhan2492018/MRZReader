
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function? onPressed;
  final String? text;
  final String? assetImage;
  final double? imageSize;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final double iconOpacity;
  final bool? outlined;
  final bool hasBorder;
  final bool isLoading;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final double? width;
  final double height;
  final IconData? icon;

  final double iconSize;
  final Color iconColors;

   CustomButton({
    Key? key,
    this.onPressed,
    this.text,
    this.assetImage,
    this.imageSize,
    this.backgroundColor,
    this.padding,
    this.fontSize,
    this.iconOpacity = 1.0,
    this.outlined,
    this.hasBorder = true,
    this.isLoading = false,
    this.fontWeight,
    this.fontColor,
    this.width,
    this.height = 36,
    this.icon,
    this.iconSize = 16,
    this.iconColors = Colors.black,
    this.circular,
  }) : super(key: key);
  double?circular;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          (outlined != null && outlined!)
              ? Colors.white
              : (backgroundColor != null)
                  ? backgroundColor
                  : (text != null)
                      ? Theme.of(context).primaryColor
                      : Colors.white,
        ),
        padding: MaterialStateProperty.all(
          padding,
        ),
        side: MaterialStateProperty.all(
          hasBorder
              ? BorderSide(
                  color: Colors.transparent,
                  width: 2,
                )
              : null,
        ),
        elevation: MaterialStateProperty.all(3),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(circular??24)
            ),
          ),
        ),
        fixedSize: (width != null)
            ? MaterialStateProperty.all(
                Size(width!, height),
              )
            : null,
      ),
      onPressed: onPressed as void Function()?,
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon, size: iconSize, color: iconColors),
                if (icon != null) SizedBox(width: 12),
                (text != null)
                    ? Text(
                        text!,
                        style: TextStyle(
                            color: fontColor ??
                                (hasBorder
                                    ? ((outlined != null && outlined!)
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary)
                                    : Colors.black),
                            fontSize: fontSize,
                            fontWeight: fontWeight),
                      )
                    : Opacity(
                        opacity: iconOpacity,
                        child: Image.asset(
                          assetImage!,
                          width: imageSize,
                          height: imageSize,
                        ),
                      ),
              ],
            ),
    );
  }
}
