import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/components/defaultbutton.dart';
import 'package:ecommerceapz/screens/splash/components/details/product_image.dart';
import 'package:ecommerceapz/screens/splash/components/details/top_rounded_continer.dart';
import 'package:ecommerceapz/screens/splash/home_screen/icon_btn_with_counter.dart';
import 'package:ecommerceapz/screens/splash/home_screen/models/product.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors_dots.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.pressOnSeeMore,
    required this.product,
  }) : super(key: key);

  final GestureTapCallback pressOnSeeMore;
  final Product product;

  @override
  Widget build(BuildContext context) {
    int selectedColor=3;
    return Column(
      children: [
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionalScreenWidth(20),
                ),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(getProportionalScreenWidth(15)),
                  width: getProportionalScreenWidth(64),
                  decoration: BoxDecoration(
                    color: product.isFavourite
                        ? Color(0xFFFFE6E6)
                        : Color(0xFFF56F99),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionalScreenWidth(20),
                  right: getProportionalScreenWidth(63),
                ),
                child: Text(
                  product.description,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionalScreenWidth(20),
                  vertical: 10,
                ),
                child: GestureDetector(
                  onTap: pressOnSeeMore,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "See More details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 12,
                        color: kPrimaryColor,
                      ),
               
                    ],
                  ),
                ),
              ),
            
            
         
            ],
          ),
          
        ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: getProportionalScreenWidth(10),
              vertical: getProportionalScreenHeight(10)
            ),
            child: Column(
              children: [
                Row(
                      children: [
                        ...List.generate(product.colors.length,
                         (index) => colordot(color: product.colors[index],
                         isSelected: selectedColor == index,
                         )
                        ),
                        Spacer(),
                        IconButton(icon:Icon(Icons.notifications_none), onPressed: (){}),
                        SizedBox(width: getProportionalScreenWidth(4),),
                        IconButton(icon: Icon(Icons.remove), onPressed: (){})
          
                      ],
                    ),
                    SizedBox(height: getProportionalScreenWidth(50),),
                    DefauktButton(press: (){}, text: "Add to cart"),
              ],
            ),
          ),
      ],
    );
  }
}

class colordot extends StatelessWidget {
  const colordot({
    super.key,
    required this.color,
    this.isSelected = false,
  });
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4),
      height: getProportionalScreenWidth(40),
      width: getProportionalScreenWidth(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
      ),
      child: Center(
        child: Container(
          height: getProportionalScreenWidth(36),
          width: getProportionalScreenWidth(25),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
