// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_solidity_store/export.dart';

class MyBotton extends StatefulWidget {
  final void Function()? onTap;
  final String? title;
  final Widget? child;
  final bool? loading;
  final bool? enable;
  const MyBotton({
    super.key,
    this.onTap,
    this.title,
    this.child,
    this.loading = false,
    this.enable = true,
  });

  @override
  State<MyBotton> createState() => _MyBottonState();
}

class _MyBottonState extends State<MyBotton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.loading == false && widget.enable == true
          ? widget.onTap
          : null,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Constant.pig_padding,
        ),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constant.large_border_radius),
          color: widget.loading == false && widget.enable == true
              ? Constant.PRIMARY_COLOR
              : Constant.SECONDARY_COLOR,
        ),
        child: widget.loading == true
            ? CircularProgressIndicator.adaptive()
            : widget.child ??
                Center(
                  child: Text(
                    widget.title ?? "",
                    textScaler: TextScaler.linear(1.1),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constant.WHITE_COLOR,
                    ),
                  ),
                ),
      ),
    );
  }
}
