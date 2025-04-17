import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_solidity_store/utils/export.dart';

class MyInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String placeholder;
  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLine;
  final bool isRequierd;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  const MyInputField({
    required this.controller,
    required this.isRequierd,
    required this.label,
    this.placeholder = '',
    this.keyboardType = TextInputType.text,
    this.maxLine = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    super.key,
    this.onChanged,
  });

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    final circularBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.normal_border_radius),
    );

    return TextFormField(
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      validator: widget.isRequierd
          ? (text) {
              if (text == null || text.trim().isEmpty) {
                return "This fisld is reqired";
              } else {
                return null;
              }
            }
          : widget.validator,
      onChanged: widget.onChanged,
      maxLines: widget.maxLine,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        alignLabelWithHint: widget.maxLine > 1 ? true : false,
        label: widget.label == null
            ? null
            : RichText(
                text: TextSpan(
                  text: widget.label,
                  style: TextStyle(color: Colors.black),
                  children: [
                    if (widget.isRequierd)
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Constant.RED_COLOR,
                        ),
                      ),
                  ],
                ),
              ),
        border: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Constant.SECONDARY_COLOR,
          ),
        ),
        errorBorder: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Constant.RED_COLOR,
            width: 1.2,
          ),
        ),
        focusedErrorBorder: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Constant.PRIMARY_COLOR,
            width: 1.2,
          ),
        ),
        focusedBorder: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Constant.SECONDARY_COLOR,
          ),
        ),
        disabledBorder: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Constant.SECONDARY_COLOR,
          ),
        ),
        enabledBorder: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Constant.SECONDARY_COLOR,
          ),
        ),
      ),
    );
  }
}
