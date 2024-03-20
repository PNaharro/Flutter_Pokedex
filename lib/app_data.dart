import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/pokedex.dart';

class AppData with ChangeNotifier {
  final pokedex = Pokedex();
}
