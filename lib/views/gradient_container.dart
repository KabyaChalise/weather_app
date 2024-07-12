import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.children});

  // This property holds the list of child widgets to be displayed inside the container
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        // Set the height and width of the container to match the screen size
        height: sizeScreen.height,
        width: sizeScreen.width,
        // Add a gradient background to the container
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.lightBlue,
              AppColors.accentBlue,
              AppColors.darkBlue,
            ],
            // Set the direction of the gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          // Add padding to the container's child
          padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
          // Use a CustomScrollView to display the list of children
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
