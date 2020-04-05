import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Fruit extends StatelessWidget {
  final data;
  double rating = 4;
  Fruit(this.data);
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: data["color"],
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset("assets/images/${data["ind"]}.png"),
                  Positioned(
                    top: 0,
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            size: 30,
                          ),
                        ),
                        Icon(
                          Icons.shopping_basket,
                          size: 30,
                        ),
                      ],
                    ),
                  )
                ],
              )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            data["name"],
                            style: TextStyle(fontSize: 20),
                          ),
                          Text("\$${data["price"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF00CC6A))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                              allowHalfRating: false,
                              onRatingChanged: (v) {
                                setState(() {
                                  rating = v;
                                });
                              },
                              starCount: 5,
                              rating: rating,
                              size: 30.0,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.blur_on,
                              color: Colors.yellowAccent,
                              borderColor: Colors.grey,
                              spacing: 0.0)
                        ],
                      ),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptatum quas incidunt quisquam, ut sunt quibusdam, saepe debitis, sit repudiandae ducimus eaque! Ducimus voluptatibus debitis nam. Totam dolore fuga quidem earum?",
                        textAlign: TextAlign.justify,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Weight",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("58 - 65 grams (g)"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE8E8E8),
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.all(5),
                                  child: Icon(Icons.remove)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text("1"),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE8E8E8),
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.all(5),
                                  child: Icon(Icons.add)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFE8E8E8)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFF00CC6A),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 70.0),
                            child: Text("Add to Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
