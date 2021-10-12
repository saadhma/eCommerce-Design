import 'package:ecommerce_design/model/item.dart';
import 'package:ecommerce_design/screens/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailPage extends StatelessWidget {
  final Item item;
  const DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          title: const Text("Detail Page")
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Image.asset(item.image, scale: 2.sp),
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: Row(
                  children: [
                    Text(item.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Text("Build for natural motion, the most flexible shoes of all time",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal)),
              SizedBox(height: 5.h),
              Text("\$ ${item.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: GestureDetector(
                  onTap: (){
                    Get.to(const ReviewsScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.star),
                        Text("Reviews",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            )),
                        const Icon(Icons.star, color: Colors.lightBlueAccent),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.add_shopping_cart_outlined),
                        Text("Add to Cart",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            )),
                        const Icon(Icons.add_shopping_cart_outlined, color: Colors.lightBlueAccent),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

