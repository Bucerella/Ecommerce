import 'package:ecommerce_riverpod/model/product_model.dart';
import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
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

  void setTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }

  void addedBasket(ProductModel model) {
    basketProducts.add(model);
    setTotalPrice(model);
    Grock.snackBar(
      title: Constants.successful,
      description: "${model.title} ${Constants.addedSuccessfully}",
      icon: Icons.check,
    );
  }

  void init() {
    for (int i = 0; i < 15; i++) {
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
