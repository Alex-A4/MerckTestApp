import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merck_test_app/const/const.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/features/result_feature/result_feature.dart';
import 'package:merck_test_app/generated/generated.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    required this.cityFrom,
    required this.cityTo,
    super.key,
  });

  final String cityFrom;
  final String cityTo;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RouteInfoTile(
          text: LocaleKeys.fromCity.tr(args: [cityFrom]),
          icon: Icons.arrow_forward_rounded,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: Sizes.verticalSpace)),
        RouteInfoTile(
          text: LocaleKeys.toCity.tr(args: [cityTo]),
          icon: Icons.arrow_back_rounded,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: Sizes.verticalSpace)),
        BlocBuilder<RouteBloc, RouteState>(
          builder: (context, state) {
            return switch (state) {
              InitialRouteState() => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
              RouteErrorState() => const SliverFillRemaining(child: ResultErrorWidget()),
              RouteDataState(route: RouteEntity route) => RoutesListWidget(route: route),
            };
          },
        ),
      ],
    );
  }
}
