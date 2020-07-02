import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fruitProvider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FruitProvider>(context).cartItems();
    print("rerendered");
    return Scaffold(
      body: Container(
        color: Colors.lime,
        child: ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(state[i].name),
                subtitle: Text(state[i].count.toString()),
                leading: Image.asset("assets/images/${state[i].image}.png"),
                trailing: Text(
                    "total: \$${double.parse(state[i].price) * state[i].count}"),
              );
            }),
      ),
    );
  }
}
