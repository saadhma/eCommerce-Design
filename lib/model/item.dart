import 'package:get/get.dart';

class Item {
  int id;
  String image;
  String name;
  int price;
  int quantity;
  RxBool inCartList; // Make inWishList observable by using the RxBool type and adding ".obs" (".obs" will be added in the Products class).

  Item(
      { required this.id,
        required this.image,
        required this.name,
        required this.price,
        required this.quantity,
        required this.inCartList});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      inCartList: map['inCartList'] as RxBool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'quantity': quantity,
      'inCartList': inCartList,
    };
  }

}