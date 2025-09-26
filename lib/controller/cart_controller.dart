import 'package:flutter/material.dart';
import 'package:shopping_app_using_api/model/productDetailsResponseModel.dart';
import 'package:shopping_app_using_api/servises/sql_services/sql_services.dart';

class CartController with ChangeNotifier {
  List<Map> cartItems = [];
  Future<void> getAllCart() async {
    cartItems = await SqlServices.getData();
    notifyListeners();
  }

  Future<void> addToCart(
    BuildContext context,
    ProductDetailsResponseModel product,
  ) async {
    try {
      await SqlServices.addData({
        "id": product.id,
        "name": product.title,
        "qty": 1,
        "img": product.thumbnail,
        "price": product.price,
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("this prodcut already added in the cart")),
      );
    }

    await getAllCart();
  }

  void incrementQty() {}
  void decrementQty() {}
  void deleteCartItem() {}
}
