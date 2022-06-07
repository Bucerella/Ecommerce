import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
import 'package:ecommerce_riverpod/view/utilities/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import '../../controller/riverpod_management.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    return Scaffold(
      body: product.favorites.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Constants.emptyFavMsg),
                  OutlinedButton(
                      onPressed: () {
                        ref.read(bottomNavbarRiverpod).setCurrentIndex(0);
                      },
                      child: Text(Constants.goToProducts))
                ],
              ),
            )
          : ListView(
              children: [
                GrockList(
                  shrinkWrap: true,
                  itemCount: product.favorites.length,
                  scrollEffect: const NeverScrollableScrollPhysics(),
                  padding: [20, 10].horizontalAndVerticalP,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      productModel: product.favorites[index],
                      setFav: () =>
                          product.setFavorite(product.favorites[index]),
                      setBasket: () {
                        product.addedBasket(product.favorites[index]);
                      },
                    );
                  },
                ),
              ],
            ),
    );
  }
}
