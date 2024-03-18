import 'package:coveverapp/features/login/domain/models/login_method_model.dart';
import 'package:coveverapp/generated/l10n.dart';

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
