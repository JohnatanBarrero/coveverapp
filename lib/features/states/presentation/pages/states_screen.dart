import 'package:coveverapp/features/states/presentation/widgets/item_state_widget.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:coveverapp/features/states/presentation/blocs/bloc/bloc.dart'
    as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
export 'package:coveverapp/features/states/presentation/blocs/bloc/bloc.dart';

class StateScreen extends StatelessWidget {
  const StateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.detailbyRegion,
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
          value: Modular.get<bloc.Bloc>()
            ..add(
              bloc.LoadInitialEvent(),
            )
            ..add(
              bloc.GetInfoStateEvent(),
            ),
          child: BlocBuilder<bloc.Bloc, bloc.State>(
            builder: (context, state) {
              if (state is bloc.GettingStatestate ||
                  state is bloc.InitialState) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Skeleton(
                        height: 65,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Skeleton(
                        height: 65,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Skeleton(
                        height: 65,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Skeleton(
                        height: 65,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Skeleton(
                        height: 65,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Skeleton(
                        height: 65,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Skeleton(
                        height: 65,
                        width: double.infinity,
                      ),
                    ),
                  ],
                );
              }
              return ListView.builder(
                itemCount: state.model.ltsInfoStateSumaryModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(top: index == 0 ? 20 : 1),
                    child: ItemStateWidget(
                      infoStateSumaryModel:
                          state.model.ltsInfoStateSumaryModel[index],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
