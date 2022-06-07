import 'package:ecommerce_riverpod/controller/bottom_navbar_riverpod.dart';
import 'package:ecommerce_riverpod/controller/product_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavbarRiverpod =
    ChangeNotifierProvider((_) => BottomNavbarRiverpod());

final productRiverpod = ChangeNotifierProvider((_) => ProductRiverpod());
