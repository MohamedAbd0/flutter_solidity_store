import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static String formatDate(DateTime date) {
    return DateFormat.yMMMEd().add_jm().format(DateTime.now());
  }

  static showErrorMessage({
    required String error,
    required BuildContext context,
  }) {
    MotionToast.error(
      title: Text(
        "Error",
        style: TextStyle(
          color: Constant.WHITE_COLOR,
        ),
      ),
      description: Text(
        error,
        style: TextStyle(
          color: Constant.WHITE_COLOR,
        ),
      ),
      toastAlignment: Alignment.topCenter,
    ).show(context);
  }

  static showSuccessMessage({
    required String message,
    required BuildContext context,
  }) {
    MotionToast.success(
      title: Text(
        "Success",
        style: TextStyle(
          color: Constant.WHITE_COLOR,
        ),
      ),
      description: Text(
        message,
        style: TextStyle(
          color: Constant.WHITE_COLOR,
        ),
      ),
      toastAlignment: Alignment.topCenter,
    ).show(context);
  }
}
