import 'package:flutter/material.dart';

class ListBean {
  String name;
  String id;
  MaterialColor txtColor;
  double txtSize;

  ListBean(this.name, this.id, this.txtColor, this.txtSize); //  get方法
  String get getName => name;

  double get getTxtSize => txtSize;

  String get getId => id;

  MaterialColor get getTxtColor => txtColor;
}
