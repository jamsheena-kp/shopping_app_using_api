import 'package:flutter/material.dart';
import 'package:shopping_app_using_api/model/categoryResponseModel.dart';
import 'package:shopping_app_using_api/servises/api_services/api_services.dart';

class HomeScreenController with ChangeNotifier {
  List<CategoryResponseModel> categories = [];
  Future<void> getCategories() async {
    final data = await ApiServices.getData("products/categories");
    if (data != null) {
      categories = categoryResponseModelFromJson(data);
    } else {
      print("Failed to fetch categories");
    }
    notifyListeners();
  }

  void getAllProducts() {}
}
