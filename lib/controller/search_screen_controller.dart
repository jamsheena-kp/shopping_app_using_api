import 'package:flutter/material.dart';
import 'package:shopping_app_using_api/model/productResponseModel.dart';
import 'package:shopping_app_using_api/servises/api_services/api_services.dart';

class SearchScreenController with ChangeNotifier {
  List<Product> productList = [];
  Future<void> searchProduct({String? query}) async {
    String enpoint = "products";
    if (query != null) {
      enpoint = "products/search?q=$query";
    }

    notifyListeners();
    final data = await ApiServices.getData(enpoint);
    if (data != null) {
      ProductResponseModel responseModel = productResponseModelFromJson(data);
      productList = responseModel.products ?? [];
    } else {
      print("failed to fetch all products");
    }

    notifyListeners();
  }
}
