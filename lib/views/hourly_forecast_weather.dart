import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/int.dart';
import 'package:weather_app_tutorial/provider/hourly_weather_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

class HourlyForecastWeather extends ConsumerWidget {
  const HourlyForecastWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);
    return hourlyWeatherData.when(
      data: (hourlyWeather) {
      return SizedBox(  
        height: 100,
        child: ListView.builder(
            itemCount: hourlyWeather.cnt,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final weather = hourlyWeather.list[index];
        
              return HourlyWeatherTile(
                  hour: weather.dt.time,
                  id: weather.weather[0].id,
                  isActive: index == 0,
                  temp: weather.main.temp.round());
            }),
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class HourlyWeatherTile extends StatelessWidget {
  final int id;
  final int temp;
  final String hour;
  final bool isActive;
  const HourlyWeatherTile(
      {super.key,
      required this.hour,
      required this.id,
      required this.isActive,
      required this.temp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
      child: Material(
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(7),
        elevation: isActive ? 7 : 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                getWeatherIcon(weatherCode: id),
                width: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hour,
                    style: TextStyle(color: AppColors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$temp°',
                    style: TextStyles.h3,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
