import 'package:get/get.dart';

class Product {
  int id;
  String image;
  String name;

  Product(
      { required this.id,
        required this.image,
        required this.name,
      });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      image: map['image'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }

}