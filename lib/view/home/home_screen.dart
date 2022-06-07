import 'package:ecommerce_riverpod/controller/riverpod_management.dart';
import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
import 'package:ecommerce_riverpod/view/utilities/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Scaffold(
      body: ListView(
        children: [
          GrockList(
            shrinkWrap: true,
            itemCount: read.products.length,
            scrollEffect: const NeverScrollableScrollPhysics(),
            padding: [20, 10].horizontalAndVerticalP,
            itemBuilder: (context, index) {
              return ProductWidget(
                productModel: watch.products[index],
                setFav: () => read.setFavorite(watch.products[index]),
                setBasket: () => read.addedBasket(watch.products[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
