import 'package:flutter/cupertino.dart';

const int fieldWidth = 12;
const int fieldHeight = 22;
const int minoWidth = 4;
const int minoHeight = 4;

const double oneBlockSize = 24.0;

Map<String, Paint> paintMap = {
  'wall': Paint()..color = const Color(0xFF777777),
  'minoI': Paint()..color = const Color(0xFF00FFFF),
  'minoO': Paint()..color = const Color(0xFFFFFF00),
  'minoS': Paint()..color = const Color(0xFF00DE00),
  'minoZ': Paint()..color = const Color(0xFFFF0000),
  'minoJ': Paint()..color = const Color(0xFF1881FF),
  'minoL': Paint()..color = const Color(0xFFFF8D00),
  'minoT': Paint()..color = const Color(0xFFFF00FF),
};