import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/extensions/strings.dart';
import 'package:weather_app_tutorial/provider/get_weather_by_city_provider.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/weather_info.dart';

class WeatherDetailsScreen extends ConsumerWidget {
  final String cityName;
  const WeatherDetailsScreen({super.key , required this.cityName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(getWeatherByCityProvider(cityName));

    return weatherData.when(data: (weather) {
      return GradientContainer(children: [
        const SizedBox(
          width: double.infinity,
        ),
        SizedBox(height: 100,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather.name,
              style: TextStyles.h1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              DateTime.now().dateTime,
              style: TextStyles.subtitleText,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 260,
              child: Image.asset(
                  'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              weather.weather[0].description.capitalize,
              style: TextStyles.h2,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        WeatherInfo(weather: weather),
        const SizedBox(
          height: 40,
        ),
        
      ]);
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
