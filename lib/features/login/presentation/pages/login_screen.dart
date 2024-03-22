import 'package:coveverapp/features/login/presentation/widgets/drop_down_type_document_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/form_number_document_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/form_password_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/login_methods_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/modal_error_login_widget.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/btn_general_widget.dart';
import 'package:coveverapp/shared/widgets/modal_show_general_widget.dart';

import 'package:flutter/material.dart';
import 'package:coveverapp/features/login/presentation/blocs/bloc/bloc.dart'
    as bloc;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
export 'package:coveverapp/features/login/presentation/blocs/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardTheme.color,
        resizeToAvoidBottomInset: true,
        body: BlocProvider.value(
          value: Modular.get<bloc.Bloc>(),
          child: BlocListener<bloc.Bloc, bloc.State>(
            listener: (context, state) {
              if (state is bloc.LogingSuccesFullState) {
                Modular.to.pushReplacementNamed(
                  '/Home',
                );
              }
              if (state is bloc.LoginFailedState) {
                return ModalShowGeneralWidget.show(
                  context,
                  heightModel: 0.55,
                  bodyIn: ModalErrroLogingWidget(
                    onPressed: () {
                      ReadContext(context).read<bloc.Bloc>().add(
                            bloc.RegisterUserEvent(),
                          );
                    },
                  ),
                );
              }
              if (state is bloc.RegisterUserState) {
                Modular.to.pop();
                Modular.to.pushNamed(
                  '/Register',
                );
              }
            },
            child: _Body(
              formKey: formKey,
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final screenSizeHeight = MediaQuery.of(context).size.height * 0.40;
    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();
    return Stack(
      children: [
        SizedBox(
          child: Image.asset(
            'assets/personaje-femenino.webp',
          ),
        ),
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: screenSizeHeight,
                      ),
                      Row(
                        children: [
                          Text(
                            '${S.current.welcometo}:',
                            style: const TextStyle(color: Color(0xFF525659)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          S.current.evertec,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF525659)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          children: [
                            BlocBuilder<bloc.Bloc, bloc.State>(
                              builder: (context, state) {
                                return DropDownTypeDocumentWidget(
                                  validator: (value) {
                                    if ((value) == 'NA') {
                                      return S
                                          .of(context)
                                          .fieldTypeDocumentInvalid;
                                    }
                                    return null;
                                  },
                                  value: (state.loginModel.typeDocumentSelected)
                                          .isEmpty
                                      ? null
                                      : state.loginModel.typeDocumentSelected,
                                  onChanged: (String value) =>
                                      ReadContext(context)
                                          .read<bloc.Bloc>()
                                          .add(
                                            bloc.SelectTypeDocumentEvent(value),
                                          ),
                                );
                              },
                            ),
                            BlocBuilder<bloc.Bloc, bloc.State>(
                              builder: (context, state) {
                                return FormNumberDocumentWidget(
                                  focusNode: focusNode1,
                                  focusNode2: focusNode2,
                                  onChanged: (value) {
                                    if (value !=
                                        state.loginModel.numberDocument) {
                                      ReadContext(context)
                                          .read<bloc.Bloc>()
                                          .add(
                                            bloc.SetNumberDocumentEvent(value),
                                          );
                                    }
                                    FocusScope.of(context)
                                        .requestFocus(focusNode1);
                                  },
                                );
                              },
                            ),
                            BlocBuilder<bloc.Bloc, bloc.State>(
                              builder: (context, state) {
                                return FormPasswordWidget(
                                  focusNode2: null,
                                  obscureText: state.loginModel.obscureText,
                                  icon: state.loginModel.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  onPressedIcon: () {
                                    ReadContext(context).read<bloc.Bloc>().add(
                                          bloc.ChangeTextPassEvent(
                                              !state.loginModel.obscureText),
                                        );
                                  },
                                  focusNode: focusNode2,
                                  onChanged: (value) {
                                    if (value != state.loginModel.password) {
                                      ReadContext(context)
                                          .read<bloc.Bloc>()
                                          .add(
                                            bloc.SetPasswordEvent(value),
                                          );
                                    }
                                    FocusScope.of(context)
                                        .requestFocus(focusNode2);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BtnGeneralWidget(
                              txt: S.current.login,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  ReadContext(context).read<bloc.Bloc>().add(
                                        bloc.LoginUserEvent(),
                                      );
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(S.current.registerUser),
                            const SizedBox(
                              height: 20,
                            ),
                            const LoginMethodWidget(),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
