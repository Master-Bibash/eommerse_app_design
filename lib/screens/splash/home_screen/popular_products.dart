import 'package:ecommerceapz/screens/splash/components/details/details_screen.dart';
import 'package:ecommerceapz/screens/splash/home_screen/section.dart';
import 'package:ecommerceapz/screens/splash/sign_uppage/sign_upscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../size_config.dart';
import 'models/product.dart';
import 'models/product_card.dart';

class Popular_item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Section(text: "Popular Product", press: () {}),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => productCard(
                  product: demoProducts[index],
                  press: (){
                  Navigator.popAndPushNamed(context,DetailsScreen.routeName,arguments: ProductDetailsArguments(product:demoProducts[index]));
                  }
                     
                ),
                
              ),
              SizedBox(
                width: getProportionalScreenWidth(20),
              ),
              //  Icon(Icons.search)
            ],
          ),
        )
      ],
    );
  }
}
