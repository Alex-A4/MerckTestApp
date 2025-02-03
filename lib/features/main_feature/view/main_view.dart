import 'package:flutter/material.dart';
import 'package:merck_test_app/const/const.dart';
import 'package:merck_test_app/generated/generated.dart';
import 'package:merck_test_app/router/router.dart';
import 'package:merck_test_app/widgets/widgets.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _toController = TextEditingController();
  final _fromController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _toController.dispose();
    _fromController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextInput(
                    labelText: LocaleKeys.enterOriginalCityLabel.tr(),
                    hintText: LocaleKeys.enterOriginalCityHint.tr(),
                    controller: _fromController,
                    validator: _inputValidator,
                  ),
                  const SizedBox(height: Sizes.verticalSpace),
                  TextInput(
                    labelText: LocaleKeys.enterDestinationCityLabel.tr(),
                    hintText: LocaleKeys.enterDestinationCityHint.tr(),
                    controller: _toController,
                    validator: _inputValidator,
                  ),
                ],
              ),
            ),
          ),
        ),
        ListenableBuilder(
          listenable: FocusScope.of(context),
          builder: (context, _) {
            final hasFocus = FocusScope.of(context).hasFocus;
            return AnimatedCrossFade(
              firstChild: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.router.push(
                      ResultRouteModule(
                        cityFrom: _fromController.text,
                        cityTo: _toController.text,
                      ),
                    );
                  }
                },
                child: Text(
                  LocaleKeys.calculateRouteButton.tr(),
                ),
              ),
              secondChild: const SizedBox(width: double.infinity),
              crossFadeState: hasFocus ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            );
          },
        ),
      ],
    );
  }

  String? _inputValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.fieldShouldNotBeEmpty.tr();
    }

    return null;
  }
}
