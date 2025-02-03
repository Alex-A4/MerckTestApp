import 'package:flutter/material.dart';
import 'package:merck_test_app/const/const.dart';
import 'package:merck_test_app/features/main_feature/main_feature.dart';
import 'package:merck_test_app/generated/generated.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.routeCalculatorTitle.tr()),
        ),
        body: SafeArea(
          minimum: Sizes.paddingForScreenWithKeyboard,
          child: const MainView(),
        ),
      ),
    );
  }
}
