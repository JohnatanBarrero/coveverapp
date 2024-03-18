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
}
