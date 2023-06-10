import 'package:ecommerceapz/screens/splash/components/profile_screen/profile_screen.dart';
import 'package:ecommerceapz/screens/splash/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapz/routs.dart';
import 'package:ecommerceapz/screens/splash/splash.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: theme(),
      // home:  Splash(),
      initialRoute: Splash.routeName,
      routes: routes,
      
    );
  }
}
