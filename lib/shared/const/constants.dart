import 'package:coveverapp/features/login/domain/models/login_method_model.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:flutter/material.dart';

final LoginMethodModel kGoogle = LoginMethodModel(
  'assets/google_logo.png',
  S.current.logingGoogleNotAviable,
);

final LoginMethodModel kFacebook = LoginMethodModel(
  'assets/facebook.png',
  S.current.logingFacebookNotAviable,
);

final LoginMethodModel kInstagram = LoginMethodModel(
  'assets/instagram.png',
  S.current.logingInstagramNotAviable,
);


   final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      width: 1,
      style: BorderStyle.solid,
      color: Color(0xFFC9C6C8),
    ),
  );

  final OutlineInputBorder errorBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 1.0,
    ),
  );

  const  TextStyle labelStyle =   TextStyle(
    color: Colors.amber,
  );