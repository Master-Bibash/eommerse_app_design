import 'package:ecommerceapz/screens/splash/components/details/details_screen_body.dart';
import 'package:ecommerceapz/screens/splash/components/details/rounded_icon.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double rating;

  const CustomAppBar({Key? key, required this.child, required this.rating})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedBtn(
              iconData: Icons.arrow_back_ios_new,
              press: () => Navigator.pop(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset(
                    "assets/icons/Star Icon.svg",
                    height: 18,
                    width: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}