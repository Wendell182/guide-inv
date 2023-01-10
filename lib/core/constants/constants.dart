import 'package:flutter/animation.dart';

class Constants {
  //colors
  static const Color blueLight = Color(0xff23b6e9);
  static const List<Color> gradientColors = [
    Color(0xff23b6e6),
    Color(0xff23b6e9),
    Color(0xff23b6ec),
    Color.fromARGB(255, 116, 241, 208),
  ];

  //strings
  static const String chartAppBarTitle = 'Gráfico de Variação';
  static const String exchangetAppBaTitle = 'Tabela de Variação';
  static const String homeAppBarTitle = 'Guide - Inv';
  static const String noDataMessage =
      'Ainda não há dados disponíveis sobre o ativo';
}
