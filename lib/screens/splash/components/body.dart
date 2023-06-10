import 'package:ecommerceapz/screens/splash/components/splash_components.dart';
import 'package:ecommerceapz/screens/splash/sign_uppage/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/size_config.dart';

import 'defaultbutton.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> splashData = [
      {
        "text": "Welcome to Tokoto, Let's shop!",
        "image": "assets/images/front.jpg",
      },
      {
        "text":
            "We help people connect with stores\naround the United States of America",
        "image": "assets/images/front2.jpg",
      },
      {
        "text": "We show the easy way to shop.\nJust stay at home with us",
        "image": "assets/images/front3.jpg",
      },
    ];
    ;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text']!,
                  imag: splashData[index]["image"]!,
                ),
              ),
            ), // Adjust the height as needed

            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionalScreenWidth(20)),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index))),
                    Spacer(
                      flex: 3,
                    ),
                    // DefaultButton(
                    //     text: "Continue",
                    //     press: () {
                    //       Navigator.pushNamed(context, SignInScreen.routeName);
                    //     }),
                    // ElevatedButton(onPressed: (){}, child: Text("Continue",
                    
                    





                    // )
                    // ),
                    SizedBox(

                          width: double.infinity,
      height: getProportionalScreenHeight(56),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>SignInScreen()));
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





                    Spacer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 3),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index
              ? kPrimaryColor
              : const Color.fromARGB(255, 234, 211, 211),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}



// class BuiildDot extends StatelessWidget {
//   const BuiildDot({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container (
//       margin: EdgeInsets.only(right: 3),
//       height: 6,
//       width: 6,
//       decoration: BoxDecoration(
//           color: kPrimaryColor, borderRadius: BorderRadius.circular(3)),
//     );
//   }
// }

         
    