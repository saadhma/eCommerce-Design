import 'package:ecommerce_design/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PaymentList extends StatelessWidget {
  PaymentList({Key? key}) : super(key: key);

  final ShopController _p = Get.find<ShopController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _p.cartItemList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _p.cartItemList[index];
        return Padding(
          padding: EdgeInsets.all(5.sp),
          child: Material(
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.all(10.sp),
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset(item.image, scale: 5.sp),
                  const SizedBox(width: 10.0),
                  Column(
                    children: [
                      Text("Product Name: ${item.name}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5.0),
                      Text("Item Price: \$ ${item.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5.0),
                      Text("Quantity: ${item.quantity}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5.0),
                      Text("Total : \$ ${(item.quantity * item.price).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  // Container(
                  //   padding: const EdgeInsets.all(15.0),
                  //   decoration: BoxDecoration(
                  //       color: Colors.grey,
                  //       borderRadius: BorderRadius.circular(20.0)
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Image.asset(image),
                  //       SizedBox(width: 10.sp),
                  //       Text(text,
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 15.sp,
                  //               fontWeight: FontWeight.bold
                  //           )),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

