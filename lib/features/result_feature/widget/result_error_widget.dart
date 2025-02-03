import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merck_test_app/const/const.dart';
import 'package:merck_test_app/features/result_feature/result_feature.dart';
import 'package:merck_test_app/generated/generated.dart';

class ResultErrorWidget extends StatelessWidget {
  const ResultErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.couldnotLoadRoute.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          const SizedBox(height: Sizes.verticalSpace),
          ElevatedButton(
            onPressed: () => context.read<RouteBloc>().add(InitRouteEvent()),
            child: Text(LocaleKeys.tryAgain.tr()),
          ),
        ],
      ),
    );
  }
}
