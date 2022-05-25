import 'dart:convert';

import 'package:ecommarce_app/Controller/card_controller.dart';
import 'package:ecommarce_app/Models/card_model.dart';

import 'package:ecommarce_app/Models/products_models.dart';
import 'package:ecommarce_app/Utilis/colors.dart';
import 'package:flutter/material.dart';

import 'package:ecommarce_app/Data/respository/popular_product_repo.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({
    required this.popularProductRepo,
  });

  List<dynamic> _popularProductList = [];
  //we can get the data anywhere by using get method
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0; //global scope
  int get quantity => _quantity;

  int _inCardItems = 0;
  int get inCardItems => _inCardItems + _quantity;

  Future<void> getPopularProductList() async {
    // call from respository
    Response response = await popularProductRepo.getPopularProductList();
    //check correct response or not
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      //add and retrun the list of object
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;

      update(); //this update more like setstate method
    } else {
      print("could not get the product");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print("increment" + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print("decrement" + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCardItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more !",
        backgroundColor: AppColors.maincolor,
        colorText: Colors.white,
      );
      if (_inCardItems > 0) {
        _quantity = -_inCardItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCardItems + quantity) > 20) {
      Get.snackbar(
        "Item count",
        "You can't add more !",
        backgroundColor: AppColors.maincolor,
        colorText: Colors.white,
      );
      if (_inCardItems > 20) {
        _quantity = -_inCardItems;
        return _quantity;
      }
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCardItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCard(product);
    //if exist
    //get from storage _inCardItems=3

    print("Exist or not " + exist.toString());

    if (exist) {
      _inCardItems = _cart.getQuantity(product);
    }

    print("The Quantity in the cart is  " + _inCardItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCardItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("The id is " +
          value.id.toString() +
          " The Quantity is " +
          value.quantity.toString());
    });
    update();
  }

  void addtocardPageItems(ProductModel product, int quantity) {
    _cart.addItem(product, quantity);
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CardModel> get getItems {
    return _cart.getItems;
  }

  int get totalAmount {
    return _cart.totalAmount;
  }
}
