import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_mariscal/app/themes/themes/black.dart';
import 'package:the_mariscal/app/themes/themes/blue.dart';
import 'package:the_mariscal/app/themes/themes/brown.dart';
import 'package:the_mariscal/app/themes/themes/cyan.dart';
import 'package:the_mariscal/app/themes/themes/deeporange.dart';
import 'package:the_mariscal/app/themes/themes/deeppurple.dart';
import 'package:the_mariscal/app/themes/themes/gray.dart';
import 'package:the_mariscal/app/themes/themes/green.dart';
import 'package:the_mariscal/app/themes/themes/lightblue.dart';
import 'package:the_mariscal/app/themes/themes/lightgreen.dart';
import 'package:the_mariscal/app/themes/themes/lime.dart';
import 'package:the_mariscal/app/themes/themes/orange.dart';
import 'package:the_mariscal/app/themes/themes/pink.dart';
import 'package:the_mariscal/app/themes/themes/purple.dart';
import 'package:the_mariscal/app/themes/themes/red.dart';
import 'package:the_mariscal/app/themes/themes/teal.dart';
import 'package:the_mariscal/app/themes/themes/indigo.dart';
import 'package:the_mariscal/app/themes/themes/yellow.dart';

import '../data/models/theme_model.dart';

class ListThemes {
  static List<ThemeModel> list = [
    ThemeModel(
      id: 'black',
      name: 'Negro',
      color: Colors.black,
      theme: BlackMaterialTheme(),
    ),
    ThemeModel(
      id: 'red',
      name: 'Rojo',
      color: Colors.red,
      theme: RedMaterialTheme(),
    ),
    ThemeModel(
      id: 'pink',
      name: 'Rosa',
      color: Colors.pink,
      theme: PinkMaterialTheme(),
    ),
    ThemeModel(
      id: 'purple',
      name: 'Púrpura',
      color: Colors.purple,
      theme: PurpleMaterialTheme(),
    ),
    ThemeModel(
      id: 'deeppurple',
      name: 'Púrpura oscuro',
      color: Colors.deepPurple,
      theme: DeepPurpleMaterialTheme(),
    ),
    ThemeModel(
      id: 'indigo',
      name: 'Índigo',
      color: Colors.indigo,
      theme: IndigoMaterialTheme(),
    ),
    ThemeModel(
      id: 'blue',
      name: 'Azul',
      color: Colors.blue,
      theme: BlueMaterialTheme(),
    ),
    ThemeModel(
      id: 'lightblue',
      name: 'Azul claro',
      color: Colors.lightBlue,
      theme: LightBlueMaterialTheme(),
    ),
    ThemeModel(
      id: 'cyan',
      name: 'Cyan',
      color: Colors.cyan,
      theme: CyanMaterialTheme(),
    ),
    ThemeModel(
      id: 'teal',
      name: 'Teal',
      color: Colors.teal,
      theme: TealMaterialTheme(),
    ),
    ThemeModel(
      id: 'green',
      name: 'Verde',
      color: Colors.green,
      theme: GreenMaterialTheme(),
    ),
    ThemeModel(
      id: 'lightgreen',
      name: 'Light Green',
      color: Colors.lightGreen,
      theme: LightGreenMaterialTheme(),
    ),
    ThemeModel(
      id: 'lime',
      name: 'Lime',
      color: Colors.lime,
      theme: LimeMaterialTheme(),
    ),
    ThemeModel(
      id: 'yellow',
      name: 'Amarillo',
      color: Colors.yellow,
      theme: YellowMaterialTheme(),
    ),
    ThemeModel(
      id: 'orange',
      name: 'Naranja',
      color: Colors.orange,
      theme: OrangeMaterialTheme(),
    ),
    ThemeModel(
      id: 'deeporange',
      name: 'Naranja oscuro',
      color: Colors.deepOrange,
      theme: DeepOrangeMaterialTheme(),
    ),
    ThemeModel(
      id: 'brown',
      name: 'Marrón',
      color: Colors.brown,
      theme: BrownMaterialTheme(),
    ),
    ThemeModel(
      id: 'grey',
      name: 'Gris',
      color: Colors.grey,
      theme: GrayMaterialTheme(),
    ),
  ];
}
