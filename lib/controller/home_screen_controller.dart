import 'package:flutter/material.dart';
import 'package:shopping_app_using_api/model/categoryResponseModel.dart';
import 'package:shopping_app_using_api/model/productResponseModel.dart';
import 'package:shopping_app_using_api/servises/api_services/api_services.dart';

class HomeScreenController with ChangeNotifier {
  bool isHomeLoading = false;
  List<CategoryResponseModel> categories = [];
  List<Product> productList = [];

  Future<void> getCategories() async {
    final data = await ApiServices.getData("products/categories");
    if (data != null) {
      categories = categoryResponseModelFromJson(data);
    } else {
      print("Failed to fetch categories");
    }
    notifyListeners();
  }

  Future<void> getAllProducts({String? category}) async {
    String enpoint = "products";
    if (category != null) {
      enpoint = "products/category/$category";
    }
    isHomeLoading = true;
    notifyListeners();
    final data = await ApiServices.getData(enpoint);
    if (data != null) {
      ProductResponseModel responseModel = productResponseModelFromJson(data);
      productList = responseModel.products ?? [];
    } else {
      print("failed to fetch all products");
    }
    isHomeLoading = false;
    notifyListeners();
  }
}
