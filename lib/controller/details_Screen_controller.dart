import 'package:flutter/material.dart';
import 'package:shopping_app_using_api/model/productDetailsResponseModel.dart';
import 'package:shopping_app_using_api/servises/api_services/api_services.dart';

class DetailsScreenController with ChangeNotifier {
  ProductDetailsResponseModel? productDetails;
  Future<void> fetchProductDetails({required String prodId}) async {
    final data = await ApiServices.getData("products/$prodId");
    if (data != null) {
      productDetails = productDetailsResponseModelFromJson(data);
      notifyListeners();
    } else {
      print("failed to fetch prodcut details");
    }
  }
}
