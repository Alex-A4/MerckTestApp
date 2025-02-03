import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:merck_test_app/const/const.dart';
import 'package:merck_test_app/di/di.dart';
import 'package:merck_test_app/features/result_feature/result_feature.dart';
import 'package:merck_test_app/generated/generated.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.cityFrom,
    required this.cityTo,
    super.key,
  });

  final String cityFrom;
  final String cityTo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouteBloc>(
      create: (_) => RouteBloc(service: inject(), cityFrom: cityFrom, cityTo: cityTo)..add(InitRouteEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.routeResultTitle.tr()),
        ),
        body: SafeArea(
          minimum: Sizes.paddingScreen,
          child: ResultView(
            cityFrom: cityFrom,
            cityTo: cityTo,
          ),
        ),
      ),
    );
  }
}
