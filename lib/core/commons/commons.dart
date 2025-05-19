import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';

import 'package:to_do_1/core/untils/app_colors.dart';
void navigate({required BuildContext context,required Widget screen}){
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => screen),);
}
void showToast({required String message,required ToastStates state}){
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: getState(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
enum ToastStates{error,succes,warining}
Color getState(ToastStates state){
  switch(state){
    case ToastStates.error:return AppsColors.red;
    case ToastStates.succes:return AppsColors.primary;
    case ToastStates.warining:return AppsColors.orange;
  }
}