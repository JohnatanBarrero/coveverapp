import 'package:coveverapp/features/login/presentation/widgets/modal_error_register.dart';
import 'package:coveverapp/shared/widgets/modal_show_general_widget.dart';
import 'package:flutter/material.dart';
import 'package:coveverapp/features/login/presentation/widgets/drop_down_type_document_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/form_email_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/form_lastname_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/form_name_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/form_number_document_widget.dart';
import 'package:coveverapp/features/login/presentation/widgets/form_password_widget.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/btn_general_widget.dart';
import 'package:coveverapp/features/login/presentation/blocs/bloc_register/register_bloc.dart'
    as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
export 'package:coveverapp/features/login/presentation/blocs/bloc_register/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    FocusNode focusName = FocusNode();
    FocusNode focusLastName = FocusNode();
    FocusNode focusEmail = FocusNode();
    FocusNode focusPass = FocusNode();
    FocusNode focusPassTwo = FocusNode();
    FocusNode focusNumber = FocusNode();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.register,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leadingWidth: 50,
          foregroundColor: const Color(0xFFEC7D33),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body: BlocProvider.value(
          value: Modular.get<bloc.RegisterBloc>(),
          child: BlocListener<bloc.RegisterBloc, bloc.State>(
            listener: (context, state) {
              if (state is bloc.SendedDataRegisterState) {
                Modular.to.pushReplacementNamed(
                  '/Home',
                );
              }
              if (state is bloc.SendErrorDataState) {
                return ModalShowGeneralWidget.show(
                  context,
                  heightModel: 0.55,
                  bodyIn: const ModalErrroRegisterWidget(),
                );
              }
            },
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Form(
                      key: formKey,
                      child: BlocBuilder<bloc.RegisterBloc, bloc.State>(
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(height: 10.0),
                              const Icon(
                                Icons.person_add_alt_outlined,
                                color: Color(0xFFEC7D33),
                                size: 50,
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                S.current.registerUser,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              FormNameDocumentWidget(
                                focusNode: focusName,
                                focusNode2: focusLastName,
                                onChanged: (value) {
                                  if (value != state.registerModel.name) {
                                    ReadContext(context)
                                        .read<bloc.RegisterBloc>()
                                        .add(
                                          bloc.SetNameEvent(value),
                                        );
                                  }
                                  FocusScope.of(context)
                                      .requestFocus(focusName);
                                },
                              ),
                              FormLastNameDocumentWidget(
                                focusNode: focusLastName,
                                focusNode2: focusEmail,
                                onChanged: (value) {
                                  if (value !=
                                      state.registerModel.numberDocument) {
                                    ReadContext(context)
                                        .read<bloc.RegisterBloc>()
                                        .add(
                                          bloc.SetLastNameEvent(value),
                                        );
                                  }
                                  FocusScope.of(context)
                                      .requestFocus(focusLastName);
                                },
                              ),
                              FormEmailWidget(
                                focusNode: focusEmail,
                                focusNode2: focusPass,
                                onChanged: (value) {
                                  if (value !=
                                      state.registerModel.numberDocument) {
                                    ReadContext(context)
                                        .read<bloc.RegisterBloc>()
                                        .add(
                                          bloc.SetEmailEvent(value),
                                        );
                                  }
                                  FocusScope.of(context)
                                      .requestFocus(focusEmail);
                                },
                              ),
                              FormPasswordWidget(
                                passOne: state.registerModel.password,
                                passTwo: state.registerModel.passwordAgain,
                                focusNode: focusPass,
                                focusNode2: focusPassTwo,
                                onChanged: (value) {
                                  if (value != state.registerModel.password) {
                                    ReadContext(context)
                                        .read<bloc.RegisterBloc>()
                                        .add(
                                          bloc.SetPasswordEvent(value),
                                        );
                                  }
                                  FocusScope.of(context)
                                      .requestFocus(focusPass);
                                },
                                onPressedIcon: () {
                                  ReadContext(context)
                                      .read<bloc.RegisterBloc>()
                                      .add(
                                        bloc.ChangeTextPassEvent(
                                            !state.registerModel.obscureText),
                                      );
                                },
                                icon: state.registerModel.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                obscureText: state.registerModel.obscureText,
                              ),
                              FormPasswordWidget(
                                passOne: state.registerModel.password,
                                passTwo: state.registerModel.passwordAgain,
                                isConfirmPass: true,
                                focusNode: focusPassTwo,
                                focusNode2: focusNumber,
                                onChanged: (value) {
                                  if (value !=
                                      state.registerModel.passwordAgain) {
                                    ReadContext(context)
                                        .read<bloc.RegisterBloc>()
                                        .add(
                                          bloc.SetPasswordAgainEvent(value),
                                        );
                                  }
                                  FocusScope.of(context)
                                      .requestFocus(focusPassTwo);
                                },
                                onPressedIcon: () {
                                  ReadContext(context)
                                      .read<bloc.RegisterBloc>()
                                      .add(
                                        bloc.ChangeTextPassEvent(
                                            !state.registerModel.obscureText),
                                      );
                                },
                                icon: state.registerModel.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                obscureText: state.registerModel.obscureText,
                              ),
                              BlocBuilder<bloc.RegisterBloc, bloc.State>(
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
                                    value: (state.registerModel
                                                .typeDocumentSelected)
                                            .isEmpty
                                        ? null
                                        : state
                                            .registerModel.typeDocumentSelected,
                                    onChanged: (String value) =>
                                        ReadContext(context)
                                            .read<bloc.RegisterBloc>()
                                            .add(
                                              bloc.SetTypeDocumentEvent(value),
                                            ),
                                  );
                                },
                              ),
                              FormNumberDocumentWidget(
                                focusNode: focusNumber,
                                focusNode2: null,
                                onChanged: (value) {
                                  if (value !=
                                      state.registerModel.numberDocument) {
                                    ReadContext(context)
                                        .read<bloc.RegisterBloc>()
                                        .add(
                                          bloc.SetNumberDocumentEvent(value),
                                        );
                                  }
                                  FocusScope.of(context)
                                      .requestFocus(focusNumber);
                                },
                              ),
                              const SizedBox(height: 12.0),
                              BtnGeneralWidget(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    ReadContext(context)
                                        .read<bloc.RegisterBloc>()
                                        .add(
                                          bloc.SendDataRegisterEvent(),
                                        );
                                  }
                                },
                                txt: S.current.registerUser,
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
