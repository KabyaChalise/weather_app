import 'package:riverpod/riverpod.dart';
import 'package:weather_app_tutorial/models/weather.dart';
import 'package:weather_app_tutorial/services/api_helper.dart';

final getWeatherByCityProvider = FutureProvider.autoDispose.family<Weather, String>((ref, String cityName) {
  return ApiHelper.getWeatherByCityName(cityName: cityName);
});
