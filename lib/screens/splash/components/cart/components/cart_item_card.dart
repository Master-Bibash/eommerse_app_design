import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/components/cart/cart.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';



class CartitemCard extends StatelessWidget {
  const CartitemCard({
    super.key, required this.cart,
  });
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionalScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(
          width: getProportionalScreenWidth(20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              demoCarts[0].product.title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(
              height: getProportionalScreenHeight(5),
            ),
            Text.rich(TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
                children: [
                  TextSpan(text: "  x${demoCarts[0].numOfItem}",style: TextStyle(color: kTextColor))
                  ]))
          ],
        ),
      ],
    );
  }
}
