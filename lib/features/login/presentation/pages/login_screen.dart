
import 'package:flutter/material.dart';
import 'package:coveverapp/features/login/presentation/blocs/bloc/bloc.dart'
    as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
export 'package:coveverapp/features/login/presentation/blocs/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
