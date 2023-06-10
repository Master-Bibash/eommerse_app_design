import 'package:ecommerceapz/screens/splash/components/form_error.dart';
import 'package:ecommerceapz/screens/splash/login_success/components/login_success.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../forgot_password.dart';

class SignForm extends StatefulWidget {
  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => email = newValue,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
            },
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: "Enter your Email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.mail),
            ),
          ),
          SizedBox(height: getProportionalScreenHeight(20)),
          TextFormField(
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kPassNullError)) {
                setState(() {
                  errors.add(kPassNullError);
                });
              } else if (value.length < 8 &&
                  !errors.contains(kShortPassErrro)) {
                setState(() {
                  errors.add(kShortPassErrro);
                });
              }
            },
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: "Enter your Password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height: getProportionalScreenHeight(10)),
          SizedBox(
            height: getProportionalScreenHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
               Text("Remember me"),
              
              Spacer(),
              TextButton(
                  onPressed: () {
                                      Navigator.pushNamed(context,ForgotPassword.routName);

                  },
                  child: Text("Forgot password",
                      style: TextStyle(decoration: TextDecoration.underline)))
            ],
          ),
                              SizedBox(height: SizeConfig.screenHeight!*0.01,),

                    FormError(errors: errors),
                    SizedBox(height: SizeConfig.screenHeight!*0.04,),

          SizedBox(
            width: double.infinity,
            height: getProportionalScreenHeight(56),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: TextButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save(); //if all valid go to success screen
                    Navigator.pushNamed(context,LoginSuccessScreen.routeName);

                    
                  }
                },
                 child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: getProportionalScreenWidth(18),
                    color: Colors.white,
                  ),
                ))
                ),
          ),
          
        ],
      ),
    );
  }

  TextFormField newPasswordMethod() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassErrro)) {
          setState(() {
            errors.remove(kShortPassErrro);
          });
        }
      },
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && errors.contains(kShortPassErrro)) {
          setState(() {
            errors.add(kShortPassErrro);
          });
          return "";
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField newEmailMethod() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
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
}