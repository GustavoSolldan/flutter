import 'package:flutter/material.dart';
import 'fuelCalculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool ou Gasolina',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelCalculator(),
      debugShowCheckedModeBanner: false, 
    );
  }
}
