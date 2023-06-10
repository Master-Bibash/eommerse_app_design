import 'package:ecommerceapz/screens/splash/components/cart/cart.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_item_card.dart';

class cart_body extends StatefulWidget {
  const cart_body({super.key});

  @override
  State<cart_body> createState() => _cart_bodyState();
}

class _cart_bodyState extends State<cart_body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder:(context, index) =>   Padding(
          padding:  EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            direction: DismissDirection.endToStart,
              key: Key(demoCarts[index].product.id.toString()),
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6)
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg")
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
                
              },
              child: CartitemCard(cart: demoCarts[index])
              ),
        ) ,
    
       
      ),
    );
  }
}

