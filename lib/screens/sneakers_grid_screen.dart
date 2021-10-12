import 'package:ecommerce_design/controller/shop_controller.dart';
import 'package:ecommerce_design/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SneakersGridScreen extends StatelessWidget {
  SneakersGridScreen({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  final ShopController _p = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
          itemCount: _p.sneakersList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (BuildContext context, int index) {
            final item = _p.sneakersList[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(DetailPage(item: item,));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.sp),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: Column(
                            children: [
                              const SizedBox(height: 5.0),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Obx(() => IconButton(
                                      onPressed: () {
                                        if (item.inCartList.value == false) {
                                          _p.addItemSneaker(item.id);
                                        } else {
                                          _p.removeItemSneaker(item.id);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.add_shopping_cart,
                                        color: item.inCartList.value == false
                                            ? Colors.black12
                                            : Colors.black,
                                        size: 15.sp,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              Expanded(flex: 2,
                                  child: Image.asset(item.image)),
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
                                child: Text("\$${item.price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
