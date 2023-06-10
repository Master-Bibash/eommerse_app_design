import 'package:ecommerceapz/screens/splash/forgot_password.dart';
import 'package:ecommerceapz/screens/splash/sign_uppage/sign_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../components/form_error.dart';
import 'package:ecommerceapz/size_config.dart';

import 'no_account.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                              SizedBox(height: SizeConfig.screenHeight! * 0.04),
          
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionalScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password or continue with social media",
                  textAlign: TextAlign.center,
                  
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                SignForm(),
                SizedBox(
                  height: getProportionalScreenHeight(70),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          // color: Colors.amber,
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionalScreenWidth(3)),
                          height: getProportionalScreenHeight(40),
                          width: getProportionalScreenWidth(40),
                          decoration: BoxDecoration(
                              color: Color(0xFF5F5F9), shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/twitter.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          // color: Colors.amber,
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionalScreenWidth(3)),
                          height: getProportionalScreenHeight(40),
                          width: getProportionalScreenWidth(40),
                          decoration: BoxDecoration(
                              color: Color(0xFF5F5F9), shape: BoxShape.circle),
                          child: SvgPicture.asset(
                             "assets/icons/Mail.svg",
                            width: 10,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                                        SizedBox(width: 10,),

                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          // color: Colors.amber,
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionalScreenWidth(3)),
                          height: getProportionalScreenHeight(40),
                          width: getProportionalScreenWidth(20),
                          decoration: BoxDecoration(
                              color: Color(0xFF5F5F9), shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            "assets/icons/facebook-2.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                noaccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// class icons_container extends StatelessWidget {

//   const icons_container({
//     super.key, required this.icon, required this.press,
//   });
//   final String icon;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(10)),
//         height: getProportionalScreenHeight(40),
//         width: getProportionalScreenWidth(40),
//         decoration: BoxDecoration(
//           color: Color(0xFF5F6F9),
//           shape: BoxShape.circle,
//         ),
//         child: SvgPicture.asset(icon),
//       ),
//     );
//   }
// }



// class error extends StatelessWidget {
//   const error({
//     super.key,
//     required this.errors,
//   });

//   final List<String> errors;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(Icons.error_outline,size: 10,
//         ),
//         Text(errors[0]),
//       ],
//     );
//   }
// }

// class _SignForm extends State<SignForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? email;
//   String? password;
//   final List<String> errors = [];

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           newEmailMethod(),
//           SizedBox(
//             height: getProportionalScreenHeight(20),
//           ),
//           formerror(errors: errors),
//           newPasswordMethod(),
//           SizedBox(
//             height: getProportionalScreenHeight(10),
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: getProportionalScreenHeight(56),
//             child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: kPrimaryColor,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SignForm()));
//                 },
//                 child: Text(
//                   ("Continue1"),
//                   style: TextStyle(
//                     fontSize: getProportionalScreenWidth(18),
//                     color: Colors.white,
//                   ),
//                 )),
//           )
//           // ElevatedButton(onPressed: (){}, child: Text("Continue"))
//         ],
//       ),
//     );
//   }

//   // TextFormField newPasswordMethod() {
//   //   return TextFormField(
//   //     validator: (value) {
//   //       if (value!.isEmpty && errors.contains(kPassNullError)) {
//   //         errors.clear(); // Clear the errors list
//   //         errors.add("Please enter your email"); // Add the new error message
//   //         return "Please enter your email";
//   //       }
//   //       return null;
//   //     },
//   //     obscureText: true,
//   //     decoration: InputDecoration(
//   //       labelText: 'Password',
//   //       hintText: "Enter your Password",
//   //       floatingLabelBehavior: FloatingLabelBehavior.always,
//   //       suffixIcon: Icon(Icons.lock),
//   //     ),
//   //   );
//   // }

// //   TextFormField newEmailMethod() {
// //     return TextFormField(
// //       onSaved: (newValue) => email= newValue,
// //       validator: (value) {
// //         if (value!.isEmpty) {
// //           errors.clear(); // Clear the errors list
// //           errors.add("Please enter your email"); // Add the new error message
// //           return "Please enter your email";
// //         }
// //         return null;
// //       },
// //       decoration: InputDecoration(
// //         labelText: 'Email',
// //         hintText: "Enter your Email",
// //         floatingLabelBehavior: FloatingLabelBehavior.always,
// //         suffixIcon: Icon(Icons.mail),
// //       ),
// //     );
// //   }
// // }



//     // width: double.infinity,
//     //   height: getProportionalScreenHeight(56),
//       // child: ElevatedButton(
//       //     style: ElevatedButton.styleFrom(
//       //         backgroundColor: kPrimaryColor,
//       //         shape: RoundedRectangleBorder(
//       //             borderRadius: BorderRadius.circular(20))),
//       //     onPressed: (){
//       //       Navigator.push(context,MaterialPageRoute(builder: (context)=>press()));
//       //     },
//       //     child: Text(
//       //       text,
//       //       style: TextStyle(
//       //         fontSize: getProportionalScreenWidth(18),
//       //         color: Colors.white,
//       //       ),
//       //     )
//       //     ),
