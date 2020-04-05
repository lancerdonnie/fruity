import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Screen2.dart';

void main() => runApp(MaterialApp(
      title: "Fruity",
      theme: ThemeData(fontFamily: 'Muli'),
      home: Home(),
    ));

class Home extends StatelessWidget {
  List<Map<dynamic, dynamic>> fruitItem = [
    {"name": "Mango", "price": "2.29", "color": Color(0xFFFFE747), "ind": 1},
    {
      "name": "Srawberry",
      "price": "2.50",
      "color": Color(0xFFE9CCFE),
      "ind": 2
    },
    {"name": "Pineaple", "price": "4.00", "color": Color(0xFF6CD0FC), "ind": 3},
    {"name": "Lemon", "price": "1.75", "color": Color(0xFFFDCBA9), "ind": 4},
    {"name": "Apple", "price": "2.40", "color": Color(0xFFFCF4D8), "ind": 5},
    {"name": "Banana", "price": "3.15", "color": Color(0xFF9FDADE), "ind": 6},
    {"name": "Orange", "price": "2.25", "color": Color(0xFF6EF46E), "ind": 7},
  ];

  int selected = 0;

  List fruits = ["Popular", "Fruits", "Vegetables", "Nuts and Seeds"];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
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
                    Icon(
                      Icons.shopping_basket,
                      size: 30,
                    ),
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
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    child: Text(
                                      fruits[i],
                                      style: TextStyle(
                                          color: selected == i
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20,
                                          backgroundColor: selected == i
                                              ? Colors.blue
                                              : Colors.transparent),
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
                                builder: (context) => Fruit(fruitItem[i])),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: fruitItem[i]["color"],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    fruitItem[i]["name"],
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
                                            text: fruitItem[i]["price"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))
                                      ])),
                                  // Text(
                                  //   "\$2.29",
                                  // style: TextStyle(
                                  //     color: Colors.white, fontSize: 20),
                                  // ),
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
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0x000).withOpacity(0.1),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ))
            ],
          ),
        ),
      );
    });
  }
}
