import 'package:coveverapp/features/home/presentation/widgets/box_data_widget.dart';
import 'package:coveverapp/features/home/presentation/widgets/date_date_widget.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:coveverapp/features/home/presentation/blocs/bloc/home_bloc.dart'
    as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCovidSecctionWidget extends StatelessWidget {
  const DataCovidSecctionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const DateData(),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
                builder: (context, state) {
                  if (state is bloc.GettingInfoCovidState ||
                      state is bloc.GettingInfoDeviceState ||
                      state is bloc.InitialState ||
                      state.homeModel.infoCovidModel == null) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(4),
                          child: const Skeleton(
                            height: 65,
                            width: 155,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(4),
                          child: const Skeleton(
                            height: 65,
                            width: 155,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(4),
                          child: const Skeleton(
                            height: 65,
                            width: 155,
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      BoxDataWidget(
                        tittle: S.current.totalCases,
                        data: state.homeModel.infoCovidModel!.totalTestResults,
                      ),
                      BoxDataWidget(
                        tittle: S.current.negativeTests,
                        data: state.homeModel.infoCovidModel!.negative,
                      ),
                      BoxDataWidget(
                        tittle: S.current.deaths,
                        data: state.homeModel.infoCovidModel!.death,
                      ),
                      BoxDataWidget(
                        tittle: S.current.pendingTests,
                        data: state.homeModel.infoCovidModel!.pending,
                      )
                    ],
                  );
                },
              ),
              BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
                builder: (context, state) {
                  if (state is bloc.GettingInfoCovidState ||
                      state is bloc.GettingInfoDeviceState ||
                      state is bloc.InitialState ||
                      state.homeModel.infoCovidModel == null) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(4),
                          child: const Skeleton(
                            height: 65,
                            width: 155,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(4),
                          child: const Skeleton(
                            height: 65,
                            width: 155,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(4),
                          child: const Skeleton(
                            height: 65,
                            width: 155,
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      BoxDataWidget(
                        tittle: S.current.confirmedCases,
                        data: state
                            .homeModel.infoCovidModel!.totalTestResultsIncrease,
                      ),
                      BoxDataWidget(
                        tittle: S.current.positiveTests,
                        data: state.homeModel.infoCovidModel!.positive,
                      ),
                      BoxDataWidget(
                        tittle: S.current.recovered,
                        data: state.homeModel.infoCovidModel!.recovered ?? 0,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
