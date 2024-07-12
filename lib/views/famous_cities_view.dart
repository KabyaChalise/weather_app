import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/models/famous_cities_model.dart';
import 'package:weather_app_tutorial/screens/weather_details_screen.dart';
import 'package:weather_app_tutorial/widgets/famous_cities_tile.dart';

class FamousCitiesView extends StatelessWidget {
  const FamousCitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: famousCities.length,
      itemBuilder: (context, index) {
        final city = famousCities[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WeatherDetailsScreen(cityName: city.name)));
            },
            child: FamousCitiesTile(index: index, city: city.name));
      },
    );
  }
}
