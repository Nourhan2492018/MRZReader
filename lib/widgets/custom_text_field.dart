
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrz_reader/utils/app_color.dart';
class CustomTextField extends StatefulWidget {
  final String hint;
  final String? hintText;
  final double? hintTextSize;
  final TextEditingController? controller;
  final bool isSecured;
  final bool isClickable;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  OutlineInputBorder? border;


  /// Max letters that can text field accept
  /// If passed the max limit it will show an error
  /// [maxLength] also shows a new widget that called [counter].
  final int maxLength;
  Color? hintColor;
  bool ? isLabel;
  bool ? isEdit;
  CustomTextField({
    Key? key,
    required this.hint,
    this.isSecured = false,
    this.controller,
    // If there is no passed [maxLength] then it will be 32 chars
    this.maxLength = 32,
    this.keyboardType,
    this.isClickable = true,
    this.hintText,
    this.hintTextSize = 16,
    this .border,
    this.focusNode,
    this.hintColor,
    this.isLabel=true,
    this.isEdit=false,


  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  void didChangeDependencies() {
    _isObscure = widget.isSecured;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder _borderDecoration = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(24)

      ),
    );
    return TextFormField(
      controller: widget.controller,
      textAlign: widget.isClickable? TextAlign.start:TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!
          .copyWith(color: Colors.black),

      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        floatingLabelBehavior:widget.isLabel!? FloatingLabelBehavior.auto:FloatingLabelBehavior.never,
        enabled: widget.isClickable,
        isDense: true,
        border: _borderDecoration,
        enabledBorder: widget.border?? _borderDecoration,
        focusedBorder: widget.border?? _borderDecoration,
        disabledBorder:widget.border?? _borderDecoration,

        labelStyle: TextStyle(fontSize: 12,color:
        widget.hintColor??AppColors.primary,),

        labelText: this.widget.hintText,
        suffixIcon: widget.isClickable ?Icon(
          Icons.edit ,color: AppColors.primary,): Icon(
          Icons.edit_off ,color: AppColors.primary,),
      ),
      obscureText: _isObscure,
      keyboardType: widget.keyboardType,
    );
  }
}
