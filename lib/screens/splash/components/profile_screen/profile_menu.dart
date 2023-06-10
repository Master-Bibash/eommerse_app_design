import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/components/profile_screen/profile_info.dart';
import 'package:ecommerceapz/screens/splash/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class profile_menu extends StatelessWidget {
  const profile_menu({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
          height: 60,
          child: ElevatedButton(
              onPressed: press,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF5F6F9),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    color: kPrimaryColor,
                    width: 22,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.black,
                  ),
                ],
              ))),
    );
  }
}