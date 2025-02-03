import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/features/result_feature/weather_bloc/weather_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _log = Logger('WeatherBloc');

  WeatherBloc({required this.service}) : super(InitialWeatherState()) {
    on<InitWeatherEvent>(_initWeather);
  }

  final WeatherService service;

  FutureOr<void> _initWeather(InitWeatherEvent event, Emitter<WeatherState> emit) async {
    try {
      final weather = await service.getWeather(event.location);

      emit(DataWeatherState(weather: weather));
    } catch (e, t) {
      _log.severe('_initWeather', e, t);

      emit(ErrorWeatherState());
    }
  }
}
