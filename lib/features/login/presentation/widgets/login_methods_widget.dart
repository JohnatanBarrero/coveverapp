import 'package:coveverapp/features/login/domain/models/login_method_model.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/const/constants.dart';
import 'package:coveverapp/shared/widgets/btn_close_widget.dart';
import 'package:coveverapp/shared/widgets/modal_show_general_widget.dart';
import 'package:flutter/material.dart';

class LoginMethodWidget extends StatelessWidget {
  const LoginMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        LoginButton(loginMethodModel: kGoogle),
        LoginButton(loginMethodModel: kFacebook),
        LoginButton(loginMethodModel: kInstagram)
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final LoginMethodModel loginMethodModel;

  const LoginButton({
    required this.loginMethodModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => ModalShowGeneralWidget.show(
        context,
        heightModel: 0.65,
        bodyIn: NoAvailableLoginWidget(
          imageLogin: Image.asset(
            loginMethodModel.imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          message: loginMethodModel.message,
        ),
      ),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(5.0),
      shape: const CircleBorder(),
      child: Image.asset(
        loginMethodModel.imagePath,
        width: 50,
        height: 50,
        fit: BoxFit.fill,
      ),
    );
  }
}

class NoAvailableLoginWidget extends StatelessWidget {
  const NoAvailableLoginWidget({
    Key? key,
    required this.imageLogin,
    required this.message,
  }) : super(key: key);

  final Image imageLogin;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 30.0),
        const Icon(
          Icons.construction,
          color: Color(0xFFEC7D33),
          size: 50,
        ),
        const SizedBox(height: 10.0),
        Text(
          S.current.pageInConstruction,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        imageLogin,
        const SizedBox(height: 8.0),
        Text(
          message,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20.0),
        const CloseBtnWidget(weight: double.infinity),
        const Divider(),
      ],
    );
  }
}
