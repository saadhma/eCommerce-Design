import 'package:ecommerce_design/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartGridScreen extends StatefulWidget {
  const CartGridScreen({Key? key}) : super(key: key);

  @override
  _CartGridScreenState createState() => _CartGridScreenState();
}

class _CartGridScreenState extends State<CartGridScreen> {
  final ShopController _p = Get.find<ShopController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      init: ShopController(), // INIT IT ONLY THE FIRST TIME
      builder: (_) => AnimationLimiter(
        child: GridView.builder(
            itemCount: _p.cartItemList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              final item = _p.cartItemList[index];
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.sp),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _.removeItemCart(item.name);
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                          size: 15.sp,
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(flex: 2, child: Image.asset(item.image)),
                              const SizedBox(height: 5.0),
                              Expanded(
                                flex: 1,
                                child: Text(item.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                    "\$ ${item.price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          _p.manageCartList(index, "Add");
                                        },
                                        child: Container(
                                          height: Get.height * 0.3,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.lightBlueAccent,
                                          ),
                                          child: const Icon(Icons.add,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Text("${item.quantity}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          _p.manageCartList(index, "Subtract");
                                        },
                                        child: Container(
                                          height: Get.height * 0.3,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.lightBlueAccent,
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10.0)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

}

