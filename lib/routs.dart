import 'package:ecommerceapz/screens/splash/components/cart/cart_screen.dart';
import 'package:ecommerceapz/screens/splash/components/completer_profile/completeProfileScreen.dart';
import 'package:ecommerceapz/screens/splash/components/details/details_screen.dart';
import 'package:ecommerceapz/screens/splash/components/otp_screen/otp_screen.dart';
import 'package:ecommerceapz/screens/splash/components/profile_screen/profile_screen.dart';
import 'package:ecommerceapz/screens/splash/forgot_password.dart';
import 'package:ecommerceapz/screens/splash/home_screen/home_screen.dart';
import 'package:ecommerceapz/screens/splash/login_success/components/login_success.dart';
import 'package:ecommerceapz/screens/splash/sign_uppage/sign_upscreen.dart';
import 'package:ecommerceapz/screens/splash/sign_uppage/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapz/screens/splash/splash.dart';

//we use name route
//All our routes will be availabel here
final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => Splash(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPassword.routName: (context) => ForgotPassword(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName :(context) => CartScreen(),
  ProfileScreen.routeName :(context) => ProfileScreen(),

};
