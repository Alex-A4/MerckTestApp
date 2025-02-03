import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:merck_test_app/const/urls.dart';
import 'package:merck_test_app/router/router.dart';

@module
abstract class BaseModule {
  /// Register it directly because there is no any additional logic for network
  @singleton
  Dio dio() => Dio(
        BaseOptions(baseUrl: Urls.baseUrl),
      );

  @singleton
  AppRouter router() => AppRouter();
}
