import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class IconsButton extends StatelessWidget {
  final IconData icon;
  final int? numOfItems;
  final Function press;

  const IconsButton({
    required this.icon,
    this.numOfItems = 0,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(getProportionalScreenWidth(5)),
            height: getProportionalScreenWidth(46),
            width: getProportionalScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                size: 29,
              ),
            ),
          ),
          if (numOfItems != 0)
            Positioned(
              height: 25,
              top: -2,
              right: 1,
              child: Container(
                height: getProportionalScreenWidth(16),
                width: getProportionalScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfItems",
                    style: TextStyle(
                      fontSize: getProportionalScreenWidth(10),
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
