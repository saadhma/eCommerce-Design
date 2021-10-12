import 'package:ecommerce_design/controller/shop_controller.dart';
import 'package:ecommerce_design/screens/components/product_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsList extends StatelessWidget {
  ProductsList({Key? key}) : super(key: key);

  final ShopController _p = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Obx( () =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: _p.products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final product = _p.products[index];
            return ProductButton(
              text: product.name,
              image: product.image,
              color: Colors.black12,
            );
          }),
    );
  }
}
