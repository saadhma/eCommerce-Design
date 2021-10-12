import 'package:ecommerce_design/controller/shop_controller.dart';
import 'package:ecommerce_design/screens/cart_grid_screen.dart';
import 'package:ecommerce_design/screens/components/payment_list.dart';
import 'package:ecommerce_design/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final ShopController _p = Get.find<ShopController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Item Cart Page",
                style: TextStyle(color: Colors.black, fontSize: 25.0)),
          ],
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: GetBuilder<ShopController>(
        init: ShopController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Row(
                children: const [
                  SizedBox(width: 30.0),
                  Text("My Cart",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20.0),
              const Expanded(child: CartGridScreen()),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Row(
            children: [
              const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              SizedBox(width: 5.w),
              const Text("CheckOut", style: TextStyle(color: Colors.white))
            ],
          ),
          onPressed: () {
            var totalBill = 0;
            for (int i = 0; i < _p.cartList.length; i++) {
              totalBill = totalBill +
                  (_p.cartList[i].quantity * _p.cartList[i].price.toInt());
            }
            showModalBottomSheet(
                isDismissible: true, // <--- this line
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0)),
                ),
                context: context,
                builder: (builder) {
                  return Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(children: <Widget>[
                      Text("Total Payment",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10.0),
                      Expanded(child: PaymentList()),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(const PaymentScreen());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.shopping_cart),
                                Text("Proceed to Checkout (\$ ${totalBill.toStringAsFixed(2)})",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );
                });
            // int? total = 0;
            // for(int i=0; i<_p.productPriceList.length; i++){
            //   total = _p.productPriceList[i] + total;
            // }
            // Get.snackbar("Bill Payment", "Amount: ${total}");
          }),
    ));
  }
}
