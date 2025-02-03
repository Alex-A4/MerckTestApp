import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:merck_test_app/features/features.dart';

@RoutePage()
class ResultPageModule extends StatelessWidget {
  const ResultPageModule({
    @PathParam('from') required this.cityFrom,
    @PathParam('to') required this.cityTo,
    super.key,
  });

  final String cityFrom;
  final String cityTo;

  @override
  Widget build(BuildContext context) {
    return ResultPage(
      cityFrom: cityFrom,
      cityTo: cityTo,
    );
  }
}
