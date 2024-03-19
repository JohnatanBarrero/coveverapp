import 'package:flutter/material.dart';

class FormatText {
  static void getFormatTextEditingController(
      TextEditingController textEditingController, String myText) {
    final textLength = myText.length;
    var selecction = TextSelection(
        affinity: TextAffinity.downstream,
        isDirectional: false,
        baseOffset: textLength,
        extentOffset: textLength);
    textEditingController.value =
        TextEditingValue(text: myText, selection: selecction);
  }
   static bool email(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    var regex = RegExp(pattern as String);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
