main() {
  FruitModel fruit =
      FruitModel(name: "apple", color: "Color(0xFFFFE747)", price: 2.34);
  print(fruit.index);
  FruitModel fruit2 =
      FruitModel(name: "apple", color: "Color(0xFFFFE747)", price: 2.34);
  print(
    fruit2.index,
  );
  print(
    fruit.index,
  );
  const list = [
    {"color": "yyyyyy"},
    {"color": "ttyy"}
  ];
  list.forEach((e) => print(e["color"]));
}

class FruitModel {
  bool clicked = false;
  String name;
  double price;
  String color;
  int index;
  static int _index = 0;

  FruitModel({this.name, this.price, this.color}) {
    this.index = _index;
    _index++;
  }
}
