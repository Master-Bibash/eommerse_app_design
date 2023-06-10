import 'package:ecommerceapz/screens/splash/components/defaultbutton.dart';
import 'package:ecommerceapz/screens/splash/components/details/product_description.dart';
import 'package:ecommerceapz/screens/splash/components/details/product_image.dart';
import 'package:ecommerceapz/screens/splash/components/details/top_rounded_continer.dart';
import 'package:ecommerceapz/screens/splash/home_screen/models/product.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class details_screen_body extends StatelessWidget {
  final Product product;

  const details_screen_body({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          productImages(
            product: product,
          ),
          ProductDescription(pressOnSeeMore: () {}, product: product),
        ],
      ),
    );
  }
}
