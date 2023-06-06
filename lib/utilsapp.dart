import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
          //.removeCurrentSnackBar(reason: SnackBarClosedReason.remove)
         //.removeCurrentSnackBar(reason: SnackBarClosedReason.remove)
          .showSnackBar(SnackBar(content: Text(text)));
}
