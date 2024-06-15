import 'package:flutter/material.dart';
import 'app_color.dart';

class AppFont {
  static TextStyle primaryText = const TextStyle(
    fontFamily: 'Poppins',
    color: AppColor.primary,
  );
  static TextStyle secondaryText = const TextStyle(
    fontFamily: 'Poppins',
    color: AppColor.secondary,
  );
  static TextStyle whiteText = const TextStyle(
    fontFamily: 'Poppins',
    color: AppColor.white,
  );
  static TextStyle blackText = const TextStyle(
    fontFamily: 'Poppins',
    color: AppColor.black,
  );
  static TextStyle greyText = const TextStyle(
    fontFamily: 'Poppins',
    color: AppColor.grey,
  );
  static TextStyle lightgreyText = const TextStyle(
    fontFamily: 'Poppins',
    color: AppColor.lightgrey,
  );
  static TextStyle redText = const TextStyle(
    fontFamily: 'Poppins',
    color: AppColor.red,
  );
  static TextStyle greenText = const TextStyle(
    fontFamily: 'Poppins',
    color: AppColor.green,
  );
}

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
