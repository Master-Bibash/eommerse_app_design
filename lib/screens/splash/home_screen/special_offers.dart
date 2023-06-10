import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class specialoffercart extends StatelessWidget {
  const specialoffercart({
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });
  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionalScreenWidth(20)),
      child: SizedBox(
        height: getProportionalScreenWidth(100),
        width: getProportionalScreenWidth(242),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.5),
                      Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionalScreenWidth(10),
                    vertical: getProportionalScreenHeight(15)),
                child: Text.rich(
                  style: TextStyle(color: Colors.white),
                  TextSpan(children: [
                    TextSpan(
                        text: "$category\n",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionalScreenWidth(18),
                        )),
                    TextSpan(text: "$numOfBrands Brands"),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
