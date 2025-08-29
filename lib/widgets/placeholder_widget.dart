import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_colors.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/splash.png'),
        // Lottie.asset(AppAnimations.emptyList),
        const Text(
          'There is No Contacts Added Here',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
