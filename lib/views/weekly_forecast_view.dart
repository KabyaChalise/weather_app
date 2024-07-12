import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/provider/weekly_weather_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyWeatherProvider);
    return weeklyForecastData.when(data: (weeklyWeather) {
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: weeklyWeather.daily.weatherCode.length,
          itemBuilder: (context, index) {
            final date = weeklyWeather.daily.time[index];
            final temp = weeklyWeather.daily.temperature2mMax[index];
            final icon = weeklyWeather.daily.weatherCode[index];
            final dayOfWeek =
                DateTime.parse(weeklyWeather.daily.time[index]).dayOfWeek;

            return WeeklyWeatherTile(
                date: date, day: dayOfWeek, icon: getWeatherIcon2(icon), temp: temp.toInt());
          });
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

class WeeklyWeatherTile extends StatelessWidget {
  final String date;
  final String day;
  final String icon;
  final int temp;
  const WeeklyWeatherTile(
      {super.key,
      required this.date,
      required this.day,
      required this.icon,
      required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: AppColors.accentBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                day,
                style: TextStyles.h3,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                date,
                style: TextStyles.subtitleText,
              )
            ],
          ),
          // Text(temp.toString()+"°C",style: TextStyles.h1,),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: temp.toString(),
                  style: TextStyles.h,
                ),
                WidgetSpan(
                  child: Transform.translate(
                    offset:  Offset(-5, -19),
                    child: Text(
                      '°C',
                      textScaleFactor: 1.3,
                      style: TextStyles.subtitleText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(icon,width: 60,)
        ],
      ),
    );
  }
}
