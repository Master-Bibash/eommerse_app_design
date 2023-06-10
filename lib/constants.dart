import 'package:ecommerceapz/screens/splash/components/otp_screen/otp_screen.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
    fontSize: getProportionalScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

//form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid email";
const String kPassNullError = "Please Enter your password";
const String kShortPassErrro = "Password is too short";
const String kMatchPassError = "Password don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecorration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getProportionalScreenWidth(15),
  ),
  enabledBorder: outlineinputBorder(),
  focusedBorder: outlineinputBorder(),
  border: outlineinputBorder(),
);



OutlineInputBorder outlineinputBorder() {
  return OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(color: kTextColor),
);
}
