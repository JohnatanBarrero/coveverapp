import 'package:coveverapp/shared/utils/format_text.dart';
import 'package:coveverapp/features/login/domain/models/enum_type_document.dart';
import 'package:coveverapp/features/login/presentation/widgets/login_methods_widget.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:coveverapp/features/login/presentation/blocs/bloc/bloc.dart'
    as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
export 'package:coveverapp/features/login/presentation/blocs/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  static OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      width: 1,
      style: BorderStyle.solid,
      color: Color(0xFFC9C6C8),
    ),
  );

  static OutlineInputBorder errorBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 1.0,
    ),
  );

  static const TextStyle labelStyle = TextStyle(
    color: Colors.amber,
  );
  @override
  Widget build(BuildContext context) {
    final screenSizeHeight = MediaQuery.of(context).size.height * 0.40;

    return SafeArea(
      child: BlocProvider.value(
        value: Modular.get<bloc.Bloc>()
          ..add(
            bloc.LoginUserEvent('34324234', 'CC', 'Colombia1234**'),
          ),
        child: BlocListener<bloc.Bloc, bloc.State>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<bloc.Bloc, bloc.State>(
            builder: (context, state) {
              return Scaffold(
                body: Stack(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                                          style: const TextStyle(
                                              color: Color(0xFF525659)),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
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
                                          DropDownWidget(
                                            textLabel:
                                                '${S.current.typeDocument}:',
                                          ),
                                          FormTextWidget(
                                            border: border,
                                            labelStyle: labelStyle,
                                            errorBorderStyle: errorBorderStyle,
                                            textLabel:
                                                '${S.current.numberDocument}:',
                                            textError:
                                                S.current.fieldNameInvalid,
                                          ),
                                          FormTextWidget(
                                            border: border,
                                            labelStyle: labelStyle,
                                            errorBorderStyle: errorBorderStyle,
                                            textLabel: '${S.current.password}:',
                                            textError:
                                                S.current.fieldpassInvalid,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          BtnGeneralWidget(
                                            formKey: formKey,
                                            txt: S.current.login,
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
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FormTextWidget extends StatelessWidget {
  const FormTextWidget({
    Key? key,
    @required this.labelStyle,
    @required this.border,
    @required this.errorBorderStyle,
    required this.textLabel,
    required this.textError,
  }) : super(key: key);

  final TextStyle? labelStyle;
  final OutlineInputBorder? border;
  final OutlineInputBorder? errorBorderStyle;
  final String textLabel;
  final String textError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        final myText = '';
        final controller = TextEditingController(text: myText);
        FormatText.getFormatTextEditingController(
          controller,
          myText,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
              child: Text(
                textLabel,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.black,
              ),
              controller: controller,
              textCapitalization: TextCapitalization.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelStyle: labelStyle,
                focusedBorder: border,
                enabledBorder: border,
                errorBorder: errorBorderStyle,
                focusedErrorBorder: errorBorderStyle,
                errorMaxLines: 1,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 1.0,
                  horizontal: 6.0,
                ),
              ),
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return textError;
                }
                return null;
              },
              onChanged: (value) {
                // if (value != state.model.name) {
                //   ReadContext(context).read<bloc.Bloc>().add(
                //         bloc.ChangeNameFormEvent(value),
                //       );
                // }
              },
            ),
          ],
        );
      },
    );
  }
}

class BtnGeneralWidget extends StatelessWidget {
  const BtnGeneralWidget({
    Key? key,
    required this.formKey,
    required this.txt,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      bloc: Modular.get<bloc.Bloc>(),
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: ButtonTheme(
                height: 45.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5.0,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // if (state.model.idOkForm) {
                      //   if (state.model.isEdit!) {
                      //     ReadContext(context).read<bloc.Bloc>().add(
                      //           bloc.UpdateAddressBackOfficeEvent(),
                      //         );
                      //   } else {
                      //     ReadContext(context).read<bloc.Bloc>().add(
                      //           bloc.SavedNewAddressBackOfficeEvent(),
                      //         );
                      //   }
                      // }
                    }
                  },
                  child: Text(
                    txt,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({Key? key, required this.textLabel}) : super(key: key);

  final String textLabel;

  @override
  Widget build(BuildContext context) {
    List<EnumTypeDocument> ltsTypeDocument = EnumTypeDocument.values;
    return BlocBuilder<bloc.Bloc, bloc.State>(
      bloc: Modular.get<bloc.Bloc>(),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                textLabel,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            DropdownButtonFormField<String>(
              focusColor: Colors.yellow,
              isExpanded: true,
              isDense: true,
              dropdownColor: Colors.white,
              items: List.generate(
                ltsTypeDocument.length,
                (i) => DropdownMenuItem<String>(
                  value: ltsTypeDocument[i].type.toString(),
                  child: Text(
                    ltsTypeDocument[i].txtToShow.toString(),
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: 'Raleway',
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                  ),
                ),
              ).toList(),
              icon: const Icon(
                Icons.arrow_drop_down,
                size: 30.0,
                color: Colors.black,
              ),
              value: (state.loginModel.typeDocumentSelected).isEmpty
                  ? null
                  : state.loginModel.typeDocumentSelected,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if ((value ?? '') == 'NA') {
                  return S.of(context).fieldTypeDocumentInvalid;
                }
                return null;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                isDense: false,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xFFC9C6C8),
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                filled: true,
              ),
              hint: Text(
                S.current.selectAtypedocument,
                style: const TextStyle(),
              ),
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.redAccent,
              ),
              onChanged: (value) {
                ReadContext(context).read<bloc.Bloc>().add(
                      bloc.SelectTypeDocumentEvent(value!),
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
