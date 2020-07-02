import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fruity/myWidgets.dart';
import 'package:fruity/provider/fruitProvider.dart';
import 'Screen2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<FruitProvider>(
            create: (context) => FruitProvider())
      ],
      child: MaterialApp(
        title: "Fruity",
        theme: ThemeData(fontFamily: 'Muli'),
        home: Home(),
      )));
}

class Home extends StatelessWidget {
  int selected = 0;

  List fruits = ["Popular", "Fruits", "Vegetables", "Nuts and Seeds"];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      final fruit = Provider.of<FruitProvider>(context);
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.apps,
                      size: 30,
                    ),
                    CartCircle()
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "What would you like?",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 20),
                      child: ListView.builder(
                          itemCount: fruits.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            return Row(children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = i;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 15),
                                    color: selected == i
                                        ? Colors.blue
                                        : Colors.transparent,
                                    child: Text(
                                      fruits[i],
                                      style: TextStyle(
                                        color: selected == i
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 28)
                            ]);
                          }),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: StaggeredGridView.countBuilder(
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          crossAxisCount: 2,
                          itemCount: 7,
                          staggeredTileBuilder: (ind) {
                            return StaggeredTile.fit(1);
                          },
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Fruit(fruit.fruits[i])),
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: fruit.fruits[i].color,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Text(
                                          fruit.fruits[i].name,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text: "\$",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                                children: [
                                              TextSpan(
                                                  text: fruit.fruits[i].price,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20))
                                            ])),
                                        GridTile(
                                          child: Image.asset(
                                              "assets/images/${i + 1}.png",
                                              fit: BoxFit.contain),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Provider.of<FruitProvider>(context,
                                                listen: false)
                                            .click(fruit.fruits[i].index);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Color(0x000).withOpacity(0.1),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10))),
                                        height: 40,
                                        width: 40,
                                        child: Icon(
                                          !fruit.fruits[i].clicked
                                              ? Icons.add
                                              : Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })))
            ],
          ),
        ),
      );
    });
  }
}
