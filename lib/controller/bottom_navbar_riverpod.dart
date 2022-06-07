import 'package:ecommerce_riverpod/view/basket/basket_screen.dart';
import 'package:ecommerce_riverpod/view/favorite/favorite_screen.dart';
import 'package:ecommerce_riverpod/view/home/home_screen.dart';
import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomNavbarRiverpod extends ChangeNotifier {
  int currentIndex = 0;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.home), label: Constants.products),
    BottomNavigationBarItem(
        icon: const Icon(Icons.favorite), label: Constants.fav),
    BottomNavigationBarItem(
        icon: const Icon(Icons.badge), label: Constants.basket),
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String appBarTitle() {
    switch (currentIndex) {
      case 0:
        return Constants.products;
      case 1:
        return Constants.fav;
      case 2:
        return Constants.basket;
      default:
        return Constants.empty;
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const FavoriteScreen();
      case 2:
        return const BasketScreen();
      default:
        return const HomeScreen();
    }
  }
}
