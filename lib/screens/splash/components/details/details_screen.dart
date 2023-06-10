import 'package:ecommerceapz/screens/splash/components/details/details_screen_body.dart';
import 'package:flutter/material.dart';

import '../../home_screen/models/product.dart';
import 'custom_appbar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details_screen";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        child: Container(),
        rating: arguments.product.rating,
      ),
      body: details_screen_body(product: arguments.product),
    );
  }
}




class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}