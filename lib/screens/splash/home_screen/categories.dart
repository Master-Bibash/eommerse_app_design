import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
      final List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    {"icon": "assets/icons/Discover.svg", "text": "More"},
  ];
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(categories.length, (index) => CategoriesCard(icon: categories[index]["icon"],press:(){} ,text: categories[index]["text"],))
        ],
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final String icon, text;
  final GestureTapCallback press;

  const CategoriesCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionalScreenWidth(50),
        child: Column(
          children: [
            Container(
              width: getProportionalScreenWidth(60),
              height: getProportionalScreenWidth(60),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(getProportionalScreenWidth(15)),
              child: SvgPicture.asset(
                icon,
                width: getProportionalScreenWidth(30),
                height: getProportionalScreenWidth(30),
              ),
            ),
            SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}