import 'package:ecommerce_riverpod/controller/riverpod_management.dart';
import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
import 'package:ecommerce_riverpod/view/utilities/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class BasketScreen extends ConsumerWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    return Scaffold(
      body: product.favorites.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Constants.emptyBasketMsg),
                  OutlinedButton(
                    onPressed: () {
                      ref.read(bottomNavbarRiverpod).setCurrentIndex(0);
                    },
                    child: Text(Constants.goToProducts),
                  )
                ],
              ),
            )
          : ListView(
              children: [
                GrockList(
                  shrinkWrap: true,
                  itemCount: product.basketProducts.length,
                  scrollEffect: const NeverScrollableScrollPhysics(),
                  padding: [20, 10].horizontalAndVerticalP,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      productModel: product.basketProducts[index],
                      setFav: () =>
                          product.setFavorite(product.basketProducts[index]),
                      setBasket: () =>{},
                    );
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: 20.horizontalP,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${Constants.totalPrice}: ${product.totalPrice} ₺",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(Constants.order),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
