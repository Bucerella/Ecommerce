import 'package:ecommerce_riverpod/controller/riverpod_management.dart';
import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavbar extends ConsumerWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavbarRiverpod);
    var read = ref.read(bottomNavbarRiverpod);
    return BottomNavigationBar(
      items: read.items,
      currentIndex: watch.currentIndex,
      onTap: (index) => read.setCurrentIndex(index),
      selectedItemColor: Constants.appColor,
    );
  }
}
