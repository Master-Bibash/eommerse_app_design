import 'package:ecommerceapz/screens/splash/components/cart/cart_screen.dart';
import 'package:ecommerceapz/screens/splash/home_screen/icon_btn_with_counter.dart';
import 'package:ecommerceapz/screens/splash/home_screen/search_product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class homeheader extends StatelessWidget {
  const homeheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionalScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // width: double.infinity,
            width: SizeConfig.screenWidth! * 0.6,
            // height: 50,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: search_item(),
          ),
         IconButton(onPressed: ()=>          Navigator.pushNamed(context,CartScreen.routeName)
, icon: Icon(Icons.shopping_cart_outlined)),
IconButton(onPressed: ()=>Icons.notifications_none,
 icon: Icon(Icons.notifications_none))
       
        ],
      ),
    );
  }
}