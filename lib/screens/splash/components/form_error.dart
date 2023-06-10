import 'package:flutter/material.dart';
import '../../../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => FormErrorText(error: errors[index]),
      ),
    );
  }
}

class FormErrorText extends StatelessWidget {
  final String error;

  const FormErrorText({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.error_rounded, color: Colors.red),
        SizedBox(
          width: getProportionalScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
