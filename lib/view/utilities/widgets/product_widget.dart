import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_riverpod/model/product_model.dart';
import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ProductWidget extends StatelessWidget {
  ProductModel productModel;
  Function setFav;
  Function setBasket;

  ProductWidget({
    Key? key,
    required this.productModel,
    required this.setFav,
    required this.setBasket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: 10.allBR),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRect(
                    child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Image.network(productModel.imagePath),
                  imageUrl: productModel.imagePath,
                )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        productModel.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productModel.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          productModel.price.toString() + " ₺",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      GrockContainer(
                        padding: 3.verticalP,
                        onTap: () => setBasket(),
                        decoration: BoxDecoration(
                          borderRadius: 10.allBR,
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.bag_badge_plus),
                            const SizedBox(width: 8),
                            Text(
                              Constants.add,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GrockContainer(
              onTap: () => setFav(),
              padding: 3.allP,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                  )
                ],
              ),
              child: Icon(
                productModel.isFav
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: productModel.isFav ? Colors.redAccent : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
