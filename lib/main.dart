import 'package:flutter/material.dart';
import 'package:route_exam/screens/cart_screen.dart';
import 'package:route_exam/screens/catalog_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Exam',
      initialRoute: CatalogScreen.routeName,
      routes: {
        CatalogScreen.routeName: (context) => const CatalogScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
      },
    );
  }
}