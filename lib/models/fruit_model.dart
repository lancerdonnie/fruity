import 'package:flutter/material.dart';

class FruitModel {
  bool clicked = false;
  String name;
  String price;
  Color color;
  int image;
  int _index;
  int count = 1;
  static int _count = 0;

  FruitModel({this.name, this.price, this.color, this.image}) {
    this._index = _count;
    _count++;
  }
  int get index => _index;
}
