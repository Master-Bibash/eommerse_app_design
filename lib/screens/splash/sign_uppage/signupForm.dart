import 'package:ecommerceapz/screens/splash/components/completer_profile/completeProfileScreen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../components/defaultbutton.dart';
import '../components/form_error.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _fromKEy = GlobalKey<FormState>();

  String? email;

  String? password;

  String? conform_password;

  final List<String> errors = [];

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
      key: _fromKEy,
      child: Column(
        children: [
          buildemail(),
          SizedBox(
            height: getProportionalScreenHeight(30),
          ),
          newPasswordMethod(),
          SizedBox(
            height: getProportionalScreenHeight(30),
          ),
          ConfirmPassword(),
          SizedBox(
            height: getProportionalScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionalScreenHeight(40),
          ),
          DefauktButton(
            press: () {
              if (_fromKEy.currentState!.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
              
            }, text: 'Continue',
          )
        ],
      ),
    );
  }

  TextFormField buildemail() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: "Enter your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
      ),
    );
  }

  TextFormField newPasswordMethod() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassErrro);
        }
      },
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassErrro);

          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField ConfirmPassword() {
    return TextFormField(
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (password == conform_password) {
          removeError(error: kMatchPassError);
        }
      },
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
        }
      },
      decoration: InputDecoration(
        labelText: 'Confirm-Password',
        hintText: "Confirm your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }
}
