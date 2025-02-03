import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merck_test_app/di/di.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/features/result_feature/weather_bloc/weather_bloc.dart';
import 'package:merck_test_app/generated/generated.dart';

class RouteStepWidget extends StatelessWidget {
  const RouteStepWidget({
    required this.step,
    super.key,
  });
  final RouteStepEntity step;

  @override
  Widget build(BuildContext context) {
    final direction = step.direction ?? 'go';
    return BlocProvider<WeatherBloc>(
      create: (_) => WeatherBloc(service: inject())..add(InitWeatherEvent(step.location)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('$direction, ${_locationToString(step.location)}'),
        leading: mapDirectionToIcon(direction),
        subtitle: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return switch (state) {
              InitialWeatherState() => const Center(child: LinearProgressIndicator()),
              DataWeatherState(weather: WeatherEntity weather) => Text.rich(
                  TextSpan(
                    children: [
                      const WidgetSpan(child: Icon(Icons.thermostat)),
                      TextSpan(text: '${weather.temperature}, ${weather.description}'),
                    ],
                  ),
                ),
              ErrorWeatherState() => Text(
                  LocaleKeys.couldnotLoadWeather.tr(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
            };
          },
        ),
      ),
    );
  }

  String _locationToString(LocationEntity location) => '${location.lat}:${location.lng}';

  Widget mapDirectionToIcon(String direction) {
    return Icon(
      switch (direction) {
        'turn-left' => Icons.arrow_back_rounded,
        'turn-right' => Icons.arrow_forward_rounded,
        _ => Icons.arrow_upward_rounded,
      },
    );
  }
}
