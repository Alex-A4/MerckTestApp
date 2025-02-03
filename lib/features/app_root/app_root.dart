import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merck_test_app/di/di.dart';
import 'package:merck_test_app/router/router.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MerckTestApp',
      routerConfig: inject<AppRouter>().config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color(0xFF006080),
          error: const Color(0xFFcc0000),
          surface: const Color(0xFFe6f2ff),
          onPrimary: const Color(0xFF006080),
          onSurface: const Color(0xFF004d80),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF002633),
          brightness: Brightness.dark,
          error: const Color(0xFF800000),
          surface: const Color(0xFF002e4d),
          onPrimary: const Color(0xFF006080),
          onSurface: const Color(0xFF004d80),
        ),
      ),
    );
  }
}
