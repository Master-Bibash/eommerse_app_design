import 'package:ecommerceapz/enum.dart';
import 'package:ecommerceapz/screens/splash/components/profile_screen/customicon.dart';
import 'package:ecommerceapz/screens/splash/home_screen/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: HomeScreenBody(),
      bottomNavigationBar: custom_navigator(selectedMenu: MenuState.home),
      );
  }
}