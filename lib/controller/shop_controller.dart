import 'dart:math';

import 'package:ecommerce_design/model/item.dart';
import 'package:ecommerce_design/model/product.dart';
import 'package:get/get.dart';

class ShopController extends GetxController{

  int currentTab = 0;
  final List<Item> cartList = [];

  void changeStatus() {
    if(currentTab == 0){
      currentTab++;
    }
    else{
      currentTab--;
    }
    update(); // use update() to update counter variable on UI when increment be called
  }

  final RxList<Item> _itemsListSneakers = List.generate(
      8,
          (index) => Item(
          id: index,
          image: "images/sneakers${index+1}.png",
          name: "Sneaker # ${index+1}",
          price: Random().nextInt(100),
          quantity: 0,
          inCartList: false.obs)).obs;

  // This will return the products that were added to wish list
  List<Item> get sneakersList {
    return _itemsListSneakers;
  }

  // Add a Sneaker to the Cart list
  void addItemSneaker(int id) {
    final int index = _itemsListSneakers.indexWhere((item) => item.id == id);
    _itemsListSneakers[index].inCartList.value = true;
    _itemsListSneakers[index].quantity++;
    cartList.add(_itemsListSneakers[id]);
  }

  // Remove a Sneaker from the Cart list
  void removeItemSneaker(int id) {
    final int index = _itemsListSneakers.indexWhere((item) => item.id == id);
    _itemsListSneakers[index].inCartList.value = false;
    _itemsListSneakers[index].quantity = 0;
    cartList.remove(_itemsListSneakers[id]);
  }

  final RxList<Item> _itemsListWatches = List.generate(
      8,
          (index) => Item(
          id: index,
          image: "images/watch${index+1}.png",
          name: "Watch # ${index+1}",
          price: Random().nextInt(100),
          quantity: 0,
          inCartList: false.obs)).obs;

  List<Item> get watchesList {
    return _itemsListWatches;
  }

  // Add a Watch to the Cart list
  void addItemWatch(int id) {
    final int index = _itemsListWatches.indexWhere((item) => item.id == id);
    _itemsListWatches[index].inCartList.value = true;
    _itemsListWatches[index].quantity++;
    cartList.add(_itemsListWatches[id]);
  }

  // Remove a Watch from the Cart list
  void removeItemWatch(int id) {
    final int index = _itemsListWatches.indexWhere((item) => item.id == id);
    _itemsListWatches[index].inCartList.value = false;
    _itemsListWatches[index].quantity = 0;
    cartList.remove(_itemsListWatches[id]);
  }

  List<Item> get cartItemList {
    return cartList;
  }

  // Remove Item from the Cart list
  void removeItemCart(String name) {
    for(int i=0; i<cartList.length; i++){
      if(cartList[i].name == name){
        cartList.remove(cartList[i]);
      }
    }

    for(int i=0; i<_itemsListSneakers.length; i++){
      if(_itemsListSneakers[i].name == name){
        _itemsListSneakers[i].inCartList.value = false;
        _itemsListSneakers[i].quantity = 0;
      }
    }

    for(int i=0; i<_itemsListWatches.length; i++){
      if(_itemsListWatches[i].name == name){
        _itemsListWatches[i].inCartList.value = false;
        _itemsListWatches[i].quantity = 0;
      }
    }
    update();
  }

  manageCartList(int index, String status){
    int totalPrice = cartList[index].price;
    int totalQuantity = cartList[index].quantity;
    double ans = totalPrice/totalQuantity;
    if(status == "Add"){
      cartList[index].quantity++;
      // cartList[index].price = cartList[index].price + ans.toInt();
    }
    else{
      if(cartList[index].quantity > 1){
        cartList[index].quantity--;
        // cartList[index].price = cartList[index].price - ans.toInt();
      }
    }
    update();
  }

  final RxList<Product> _productsList = List.generate(
      2,
          (index) => Product(
          id: index,
          image: index == 0 ? "images/sneakers8.png" : "images/watch1.png",
          name: index == 0 ? "Sneakers" : "Watches")).obs;

  // This will return the products that were added to wish list
  List<Product> get products {
    return _productsList;
  }

}