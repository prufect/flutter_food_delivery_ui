import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food Delivery',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        backgroundColor: Colors.grey[50],
      ),
      home: HomeScreen(),
    );
  }
}
