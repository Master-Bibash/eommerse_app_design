import 'package:ecommerceapz/screens/splash/home_screen/home_screen.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../constants.dart';

class login_success_body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
            color:Colors.white, // Specify the color using the color code
          child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
          Image.asset("assets/images/success.jpg",width: double.infinity,),
          Text(
            "Login Success",
            style: TextStyle(
                fontSize: getProportionalScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Spacer(),
         SizedBox(
          width: SizeConfig.screenWidth! * 0.6 ,
          height: SizeConfig.screenHeight! * 0.08,
           child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: (){
              Navigator.pushNamed(context,HomeScreen.routeName);
            },
            child: Text(
              ("Continue"),
              style: TextStyle(
                fontSize: getProportionalScreenWidth(18),
                color: Colors.white,
              ),
            )
            ),
         ),
          Spacer(),
        ],
      ),
    );
  }
}
