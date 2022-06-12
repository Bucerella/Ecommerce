import 'package:ecommerce_riverpod/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];
  List<ProductModel> basketProducts = [];
  double totalPrice = 0.0;

  void setFavorite(ProductModel model) {
    if (model.isFav) {
      model.isFav = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFav = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void addTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }

  void deleteTotalPrice(ProductModel model) {
    totalPrice -= model.price;
  }

  void addedBasket(ProductModel model) {
    basketProducts.add(model);
    addTotalPrice(model);
    notifyListeners();
  }

  void deleteBasket(ProductModel model) {
    basketProducts.remove(model);
    deleteTotalPrice(model);
    notifyListeners();
  }

  void init() {
    for (int i = 0; i < 30; i++) {
      products.add(
        ProductModel(
          isFav: false,
          title: "Xiaomi ${i + 1}",
          description: "${8 + (i * 2)} MP kameralı ve 55${i * 10} mAh batarya",
          price: 6000.0 + (i * 10),
          imagePath: i.randomImage(),
        ),
      );
    }
  }
}
