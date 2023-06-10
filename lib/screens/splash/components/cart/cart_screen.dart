import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/components/cart/cart.dart';
import 'package:ecommerceapz/screens/splash/components/defaultbutton.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/cart_body.dart';

class CartScreen extends StatelessWidget {
  // const CartScreen({super.key});
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: cart_body(),
      bottomNavigationBar: check_yourcart(),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text("${demoCarts.length} items",
              style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}

class check_yourcart extends StatelessWidget {
  const check_yourcart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionalScreenWidth(15),
        horizontal: getProportionalScreenWidth(30)
      ),
      height: 173,
     decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, -15),
          blurRadius: 20,
          color: Colors.black.withOpacity(0.15)
        )
      ]
     ),
     child: SafeArea(
       child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: getProportionalScreenWidth(40),
                width: getProportionalScreenWidth(40),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:SvgPicture.asset("assets/icons/receipt.svg"),
              ),
              Spacer(),
              Text("Add voucher code"),
              SizedBox(width: 10,),
              Icon(Icons.arrow_forward_ios,size: 12,color: kTextColor,),
            ],
          ),
          SizedBox(height: getProportionalScreenHeight(20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "Total:\n",
                children:[ TextSpan(
                  text: "\$337.15",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  )
                )]),
                
              ),
              SizedBox(
                width: getProportionalScreenWidth(190),
                child: DefauktButton(press: (){},
                 text: "Check out"),
              )
            ],
          ),
        ],
       ),
     ),
    );
  }
}
