import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:coveverapp/features/home/presentation/blocs/bloc/home_bloc.dart'
    as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateData extends StatelessWidget {
  const DateData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
      builder: (context, state) {
        if (state is bloc.GettingInfoCovidState ||
            state is bloc.GettingInfoDeviceState ||
            state is bloc.InitialState ||
            state.homeModel.infoCovidModel == null) {
          return const Skeleton(
            width: 200,
            height: 20,
          );
        }
        return Text(
          '${S.current.dataCollectionDate}:${DateFormat('dd.MM.yyyy').format(
            DateTime.parse(state.homeModel.infoCovidModel!.dateChecked),
          )}',
          style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.openSans().fontFamily,
                letterSpacing: 1,
              ),
        );
      },
    );
  }
}
