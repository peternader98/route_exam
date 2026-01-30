import 'package:flutter/material.dart';

class AppTheme {
  static TextStyle title = TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle price = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle review = TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xFF6F7C8E));
  static TextStyle cartPrice = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle cartCurrency = cartPrice.copyWith(fontSize: 12, color: Color(0xFF959595));
  static TextStyle free = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF06AD00));
  static TextStyle cartDescription = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF959595));
}