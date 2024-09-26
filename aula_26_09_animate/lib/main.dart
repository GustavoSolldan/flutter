import 'package:flutter/material.dart';
import 'package:aula_26_09_animate/home.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.cyan,
      scaffoldBackgroundColor: Colors.blueAccent
    )
  )
);
