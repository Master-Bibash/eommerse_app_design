
import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/home_screen/models/product.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';



class productImages extends StatefulWidget {
  const productImages({
    required this.product,
  });

  final Product product;

  @override
  State<productImages> createState() => _productImagesState();
}

class _productImagesState extends State<productImages> {
    int selectedImage=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: getProportionalScreenWidth(228),
            child: AspectRatio(aspectRatio: 1,
            child: Image.asset(widget.product.images[selectedImage]),
          
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
         children:[ ...List.generate(widget.product.images.length, 
         (index) => buildSmaillPreview(index))],

        )

      ],
    );
  }

  GestureDetector buildSmaillPreview(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedImage=index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionalScreenWidth(15)),
              padding: EdgeInsets.all(getProportionalScreenHeight(8)),
              height: getProportionalScreenWidth(48),
              width: getProportionalScreenWidth(48),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: selectedImage==index ?kPrimaryColor : Colors.transparent)
              ),
              child: Image.asset(widget.product.images[index]),
    
            ),
    );
  }
}