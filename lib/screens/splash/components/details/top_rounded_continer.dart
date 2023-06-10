
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';



class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    super.key, required this.color, required this.child,
  });
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionalScreenWidth(2)),
      padding: EdgeInsets.only(top: getProportionalScreenWidth(10)),
 
      width:double.infinity,
      height:getProportionalScreenHeight(190),
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
        topRight: Radius.circular(40))

      ),
      child: child,
    );
  }
}