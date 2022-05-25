import 'package:ecommarce_app/Models/products_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommarce_app/Data/respository/cart_repo.dart';

import '../Models/card_model.dart';
import '../Utilis/colors.dart';

class CartController extends GetxController {
  final CardRepo cardRepo;
  CartController({
    required this.cardRepo,
  });

  Map<int, CardModel> _items = {};
  Map<int, CardModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    // print("length of the items is " + _items.length.toString());
    var totalQuantity = 0;

    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CardModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CardModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar(
          "Item count",
          "You should at least add an one item in the cart !",
          backgroundColor: AppColors.maincolor,
          colorText: Colors.white,
        );
      }
    }
    update();
  }

  bool existInCard(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      return true;
    } else {
      return false;
    }
  }

//quantity value store in app
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    //update
    update();
    return totalQuantity;
  }

  List<CardModel> get getItems {
    //entries helps to create another map
    var getItems = _items.entries.map((e) {
      return e.value;
    }).toList();

    return getItems;
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    // update();
    return total;
  }
}
