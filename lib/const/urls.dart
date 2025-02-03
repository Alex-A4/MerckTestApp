class Urls {
  const Urls._();

  static const String baseUrl = 'https://scrmobiletest.azurewebsites.net/api/';

  static String weatherPath({required double lat, required double lng}) => 'Weather/$lat/$lng';
  static String routePath({required String from, required String to}) => 'route/$from/$to';
}
