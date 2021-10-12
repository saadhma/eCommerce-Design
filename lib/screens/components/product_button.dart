import 'package:ecommerce_design/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

//ignore: must_be_immutable
class ProductButton extends StatelessWidget {
  String text;
  String image;
  Color color;
  ProductButton({Key? key,
    required this.text, required this.image, required this.color}) : super(key: key);

  final ShopController _p = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: GestureDetector(
          onTap: (){
            _p.changeStatus();
          },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Row(
              children: [
                Image.asset(image),
                SizedBox(width: 10.sp),
                Text(text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                    )),
              ],
            ),
          ),
        ),
    );
  }
}
