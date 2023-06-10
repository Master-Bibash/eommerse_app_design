import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/home_screen/models/product.dart';
import 'package:ecommerceapz/screens/splash/home_screen/popular_products.dart';
import 'package:ecommerceapz/screens/splash/home_screen/section.dart';
import 'package:ecommerceapz/screens/splash/home_screen/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'homeheader.dart';
import 'icon_btn_with_counter.dart';
import 'package:ecommerceapz/size_config.dart';

import 'models/product_card.dart';

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: getProportionalScreenHeight(20),
            ),
           
            homeheader(), 
             SizedBox(
              height: getProportionalScreenHeight(30),
            ),// Use PascalCase for class names
            discountbanner(), // Use PascalCase for class names
            SizedBox(
              height: getProportionalScreenHeight(20),
            ),
            Categories(),
            SizedBox(
              height: getProportionalScreenHeight(30),
            ),
           SpecialOffers(),
           SizedBox(
              height: getProportionalScreenHeight(30),
            ),
            Popular_item(),
       
            

          ],
        ),
      ),
    );
  }
}



class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
        Section(
       press: () {},
       text: "Special for you",
     ),
     SizedBox(height:getProportionalScreenHeight(14) ,),
     SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       physics: BouncingScrollPhysics(),
       child: Row(
         children: [
           specialoffercart(
               category: "Smartphone",
               image: "assets/images/Image Banner 2.png",
               press: () {},
               numOfBrands: 18),
           specialoffercart(
               category: "Smartphone",
               image: "assets/images/Image Banner 2.png",
               press: () {},
               numOfBrands: 18),
         ],
       ),
     ),
     ],
    );
  }
}

