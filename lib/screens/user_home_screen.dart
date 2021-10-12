import 'package:ecommerce_design/controller/shop_controller.dart';
import 'package:ecommerce_design/screens/cart_screen.dart';
import 'package:ecommerce_design/screens/components/header.dart';
import 'package:ecommerce_design/screens/products_list.dart';
import 'package:ecommerce_design/screens/responsive.dart';
import 'package:ecommerce_design/screens/sneakers_grid_screen.dart';
import 'package:ecommerce_design/screens/watches_grid_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);

  final ShopController _p = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: GetBuilder<ShopController>(
            init: ShopController(), // INIT IT ONLY THE FIRST TIME
            builder: (_) => Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  const Header(),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(width: 10.sp),
                      Text("Our Featured Products",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Responsive(
                    mobile: SizedBox(height: 15.h,
                        child: ProductsList()
                    ),
                    // FileInfoCardGridView(
                    //   crossAxisCount: _size.width < 650 ? 2 : 4,
                    //   childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                    // ),
                    tablet: Expanded(child: ProductsList()),
                    desktop: Expanded(child: ProductsList())
                  ),
                  // SizedBox(height: 15.h,
                  //     child: ProductsList()
                  // ),
                  const SizedBox(height: 10.0),
                  _.currentTab == 0 ?
                  Responsive(
                    mobile: Expanded(
                      child: SneakersGridScreen(
                        crossAxisCount: _size.width < 650 ? 2 : 2,
                        childAspectRatio: _size.width < 650 && _size.width > 350 ? 1 : 1,
                      ),
                    ),
                    tablet: Expanded(child: SneakersGridScreen()),
                    desktop: Expanded(
                      child: SneakersGridScreen(
                        childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                      ),
                    ),
                  )
                  // Expanded(child: SneakersGridScreen(
                  //   crossAxisCount: _size.width < 650 ? 2 : 4,
                  //   childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                  // ))
                      :
                  Expanded(child: WatchesGridScreen()),
                ],
              ),
            ),
          )
          ),
        );
  }
}
