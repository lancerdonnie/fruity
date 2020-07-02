import 'package:flutter/material.dart';
import 'package:fruity/models/fruit_model.dart';

class FruitProvider with ChangeNotifier {
  List<Map<dynamic, dynamic>> fruitItem = [
    {
      "clicked": false,
      "name": "Mango",
      "price": "2.29",
      "color": Color(0xFFFFE747),
      "image": 1
    },
    {
      "clicked": false,
      "name": "Srawberry",
      "price": "2.50",
      "color": Color(0xFFE9CCFE),
      "image": 2
    },
    {
      "clicked": false,
      "name": "Pineaple",
      "price": "4.00",
      "color": Color(0xFF6CD0FC),
      "image": 3
    },
    {
      "clicked": false,
      "name": "Lemon",
      "price": "1.75",
      "color": Color(0xFFFDCBA9),
      "image": 4
    },
    {
      "clicked": false,
      "name": "Apple",
      "price": "2.40",
      "color": Color(0xFFFCF4D8),
      "image": 5
    },
    {
      "clicked": false,
      "name": "Banana",
      "price": "3.15",
      "color": Color(0xFF9FDADE),
      "image": 6
    },
    {
      "clicked": false,
      "name": "Orange",
      "price": "2.25",
      "color": Color(0xFF6EF46E),
      "image": 7
    },
  ];

  FruitProvider() {
    fromList();
  }

  List<FruitModel> fruits = [];
  List<int> cart = [];

  void fromList() {
    fruitItem.forEach((e) => fruits.add(FruitModel(
        name: e["name"],
        price: e["price"],
        color: e["color"],
        image: e["image"])));
  }

  void click(int index) {
    final f = fruits.singleWhere((t) => t.index == index);
    f.clicked = !f.clicked;

    final y = cart.where((e) => e == index);

    if (y.length < 1) {
      cart.add(f.index);
    } else {
      cart.removeWhere((x) => x == index);
    }
    notifyListeners();
  }

  void increase(index) {
    fruits[index].count++;
    notifyListeners();
  }

  void decrease(index) {
    fruits[index].count--;
    notifyListeners();
  }

  int fruitInCart(int index) {
    final x = fruits.singleWhere((e) => e.index == index);
    return x.count;
  }

  List<FruitModel> cartItems() {
    final List<FruitModel> arr = [];
    cart.forEach((index) {
      arr.add(fruits.singleWhere((i) => i.index == index));
    });
    return arr;
  }
}
