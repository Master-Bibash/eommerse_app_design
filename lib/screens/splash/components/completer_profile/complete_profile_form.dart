import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/components/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../defaultbutton.dart';
import '../form_error.dart';

class CompleteProfileForm extends StatefulWidget {
  // const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormFirstame(),
          SizedBox(
            height: getProportionalScreenHeight(30),
          ),
          TextFormLastName(),
          SizedBox(
            height: getProportionalScreenHeight(30),
          ),
          PhoneNumber(),
          SizedBox(
            height: getProportionalScreenHeight(30),
          ),
          Address(),
          FormError(errors: errors),
          // formerror(errors: errors),
          SizedBox(
            height: getProportionalScreenHeight(30),
          ),
          DefauktButton( press: (){
            if (_formKey.currentState!.validate()) {
              //to goto OTP screen\
              Navigator.push(context,MaterialPageRoute(builder: (context) => OtpScreen(),));

              
            }
          }, text: 'Continue',)

        ],
      ),
    );
  }

  TextFormField TextFormFirstame() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      keyboardType: TextInputType.name,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'first Name',
        hintText: "Enter your first Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person),
      ),
    );
  }
  TextFormField TextFormLastName() {
    return TextFormField(
      // onSaved: (newValue) => lastName = newValue,
      // keyboardType: TextInputType.text,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kNameNullError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kNameNullError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: 'Last Name',
        hintText: "Enter your last  Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person),
      ),
    );
  }
  TextFormField PhoneNumber() {
    return TextFormField(
      onSaved: (newValue) => phoneNumber = newValue,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'phonenumber',
        hintText: "Enter your PhoneNumber",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }
  TextFormField Address() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      keyboardType: TextInputType.streetAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Address Name',
        hintText: "Enter your Address Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.location_on),
      ),
    );
  }
}
