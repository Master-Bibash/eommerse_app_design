import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class discountbanner extends StatelessWidget {
  const discountbanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionalScreenWidth(20)),
      // padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(10)),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        
        padding: EdgeInsets.symmetric(
          
            horizontal: getProportionalScreenWidth(20),
            vertical: getProportionalScreenWidth(15
            ),
            
            
            ),
        child: Text.rich(
          TextSpan(
              text: "A summer Surprise\n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: "Cashback 20%",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    );
  }
}