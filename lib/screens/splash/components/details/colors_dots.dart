import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/components/details/product_description.dart';
import 'package:ecommerceapz/screens/splash/components/details/product_image.dart';
import 'package:ecommerceapz/screens/splash/components/details/top_rounded_continer.dart';
import 'package:ecommerceapz/screens/splash/home_screen/models/product.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class colorbot extends StatelessWidget {
  const colorbot({
    super.key,
    required this.product,
  });

  final Product product;
  // final Product product;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 3;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
              product.colors.length,
              (index) => colordot(
                    color: product.colors[index],
                    isSelected: selectedColor == index,
                  )),
          Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
          SizedBox(width: getProportionalScreenWidth(15),),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          
          
        ],
      ),
    );
  }
}

