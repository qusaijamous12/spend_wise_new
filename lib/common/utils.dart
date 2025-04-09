import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color_extension.dart';

class Utils{
  static void hideKeyboard(context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
  static Future<bool?> myToast({required String title}){
    return   Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: TColor.primary,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}