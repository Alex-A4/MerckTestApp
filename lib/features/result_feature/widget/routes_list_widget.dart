import 'package:flutter/material.dart';
import 'package:merck_test_app/const/const.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/features/result_feature/result_feature.dart';
import 'package:merck_test_app/generated/generated.dart';

class RoutesListWidget extends StatelessWidget {
  const RoutesListWidget({
    required this.route,
    super.key,
  });

  final RouteEntity route;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        RouteInfoTile(
          text: LocaleKeys.duration.tr(args: [route.duration.inMinutes.toString()]),
          icon: Icons.access_time_filled_sharp,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: Sizes.verticalSpace)),
        RouteInfoTile(
          text: LocaleKeys.distance.tr(args: [route.distance.toString()]),
          icon: Icons.route_outlined,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: Sizes.verticalSpace)),
        const SliverToBoxAdapter(child: Divider()),
        SliverList.builder(
          addAutomaticKeepAlives: true,
          itemCount: route.steps.length,
          itemBuilder: (context, index) => RouteStepWidget(step: route.steps[index]),
        )
      ],
    );
  }
}
