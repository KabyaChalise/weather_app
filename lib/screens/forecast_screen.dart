import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/hourly_forecast_weather.dart';
import 'package:weather_app_tutorial/views/weekly_forecast_view.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(children: [
        Text('Forecast Report',style: TextStyles.h1,textAlign: TextAlign.center,),
        SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Today',style: TextStyles.h2,),
            Text(DateTime.now().dateTime,style: TextStyles.subtitleText,)
          ],
        ),
        SizedBox(height: 20,),
        HourlyForecastWeather(),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Next Forecast',style: TextStyles.h2,),
            Icon(Icons.calendar_month_outlined,color: AppColors.white,)
          ],
        ),
        SizedBox(height: 20,),
        WeeklyForecastView()
      ]),
    );
  }
}