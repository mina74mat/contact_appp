import 'package:flutter/material.dart';
import 'app_colors.dart';


class AppStyles {
  static const TextStyle font16WhiteMudium = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle hintTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle elevatedButtonTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle cardUserNameTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle cardContentTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}
