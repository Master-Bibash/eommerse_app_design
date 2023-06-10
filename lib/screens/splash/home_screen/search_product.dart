import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class search_item extends StatelessWidget {
  const search_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: "Search product here",
        prefixIcon: Icon(
          Icons.search,
          color: kSecondaryColor.withOpacity(0.9),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionalScreenWidth(20),
          vertical: getProportionalScreenWidth(9),
        ),
      ),
    );
  }
}