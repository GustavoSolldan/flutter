import 'package:aula_26_09_animate/bicho.dart';
import 'package:aula_26_09_animate/numeros.dart';
import 'package:aula_26_09_animate/vogais.dart';
import 'package:aula_26_09_animate/videos.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState(){
    super.initState();

    _tabController = TabController();
  }
}