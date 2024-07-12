import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/provider/get_weather_by_city_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

class FamousCitiesTile extends ConsumerWidget {
  final String city;
  final int index;
  const FamousCitiesTile({super.key, required this.city, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDetails = ref.watch(getWeatherByCityProvider(city));
    return weatherDetails.when(data: (weather) {
      return Material(
        elevation: index == 0 ? 8 : 0,
        color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${weather.main.temp.round().toString()}°',
                          style: TextStyles.h2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          weather.weather[0].description,
                          style: TextStyles.subtitleText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                      width: 50,
                      getWeatherIcon(weatherCode: weather.weather[0].id))
                ],
              ),
              Text(weather.name,style: TextStyle(color: Colors.white,fontSize: 18),)

            ],
          ),
        ),
      );
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
