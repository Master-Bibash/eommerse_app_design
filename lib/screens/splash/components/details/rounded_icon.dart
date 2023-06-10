import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../home_screen/models/product.dart';

class RoundedBtn extends StatelessWidget {
  const RoundedBtn({
    super.key, required this.iconData, required this.press,
  });
  final IconData iconData;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionalScreenWidth(40),
      width: getProportionalScreenWidth(40),
      child: IconButton(
        onPressed: press,
       icon: Icon(iconData),
       padding: EdgeInsets.zero,
      //  color: Colors.white,

       ),
    );
  }
}