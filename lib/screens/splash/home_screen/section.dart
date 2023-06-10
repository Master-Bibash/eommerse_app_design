import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    required this.text,
    required this.press,
    super.key,
  });
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: TextStyle(fontSize: getProportionalScreenWidth(18),
          color: Colors.black
          
          ),),
          GestureDetector(child: Text("see more",style: TextStyle(color: Colors.black26),),onTap: press,)
        ],
      ),
    );
  }
}