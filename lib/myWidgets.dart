import 'package:flutter/material.dart';
import 'package:fruity/provider/cart_screen.dart';
import 'package:fruity/provider/fruitProvider.dart';
import 'package:provider/provider.dart';

class CartCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartScreen()),
        );
      },
      child: Stack(children: [
        Icon(
          Icons.shopping_basket,
          size: 30,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            maxRadius: 8.0,
            child: Consumer<FruitProvider>(builder: (context, value, child) {
              return Text(
                value.cart.length.toString(),
                style: TextStyle(fontSize: 12),
              );
            }),
          ),
        ),
      ]),
    );
  }
}
