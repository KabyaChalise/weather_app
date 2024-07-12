
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/double.dart';
import 'package:weather_app_tutorial/models/weather.dart';

class WeatherInfo extends StatelessWidget {
  final Weather weather;
  const WeatherInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherInfoTile(
            title: 'Temp', 
            value: '${weather.main.temp}°'
            ),
          WeatherInfoTile(
            title: 'Wind', 
            value: '${weather.wind.speed.kmh}km/h'
            ),
          WeatherInfoTile(
            title: 'Humidity', 
            value: '${weather.main.humidity}%'
            ),
        ],
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  final String title;
  final String value;
  const WeatherInfoTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,style: TextStyles.subtitleText,),
        SizedBox(height: 10,),
        Text(value,style: TextStyles.h3,),

      ],
    );
  }
}
