import 'package:flutter_test/flutter_test.dart';
import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

void main() {
  const location = LocationEntity(lat: 32, lng: 33);

  late WeatherRepositoryMock weatherRepository;
  late WeatherService weatherService;

  setUp(() {
    weatherRepository = WeatherRepositoryMock();
    weatherService = WeatherServiceImpl(repository: weatherRepository);
    registerFallbackValue(location);
  });

  test('Test converting json data into entity', () async {
    when(() => weatherRepository.getWeather(any())).thenAnswer(
      (_) => Future.value(WeatherDto.fromJson(weatherData)),
    );

    final weather = await weatherService.getWeather(location);

    expect(weather.description, 'overcast clouds');
    expect(weather.temperature, 17.0);
    expect(weather.location, location);
  });
}

final weatherData = {"description": "overcast clouds", "temperature": 17};
