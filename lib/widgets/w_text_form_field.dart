import 'package:flutter/material.dart';

class RTextFormField extends StatefulWidget {
  final TextEditingController? txtController;
  final String? labelText;
  final bool? obscureText;
  const RTextFormField({
    super.key,
    this.labelText,
    this.obscureText = false,
    this.txtController,
  });

  @override
  State<RTextFormField> createState() => _RTextFormFieldState();
}

class _RTextFormFieldState extends State<RTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.txtController,
        obscureText: widget.obscureText!,
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          enabledBorder: enabledBorder,
        ),
        validator: (v) => vFunction(v!));
  }

  OutlineInputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.red,
        width: 3,
      ));

  OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.red,
        width: 3,
      ));

  OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 3,
      ));

  OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.purple.shade300,
        width: 3,
      ));

  vFunction(String val) {
    if (val.isEmpty) {
      return 'Please Enter Value';
    } else {
      return null;
    }
  }
}
