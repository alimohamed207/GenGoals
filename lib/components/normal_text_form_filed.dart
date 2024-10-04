import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NormaltextFormFiled extends StatefulWidget {
  NormaltextFormFiled({
    super.key,
    required this.label,
    required this.icon,
    this.onChanged,
  });
  final String label;
  final Icon icon;

  Function(String)? onChanged;

  @override
  State<NormaltextFormFiled> createState() => _NormaltextFormFiledState();
}

class _NormaltextFormFiledState extends State<NormaltextFormFiled> {
  var foucsNodeEmail = FocusNode();
  var foucsNodePassword = FocusNode();
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;

  @override
  void initState() {
    foucsNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = foucsNodeEmail.hasFocus;
      });
    });
    foucsNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = foucsNodePassword.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 600),
      duration: const Duration(milliseconds: 700),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
            color: isFocusedEmail ? Colors.white : const Color(0xFFF1F0F5),
            border: Border.all(
              width: 1,
              color: const Color(0xFFD2D2D4),
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (isFocusedEmail)
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 90, 146, 184).withOpacity(.3),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                )
            ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email';
            }

            return null;
          },
          onChanged: widget.onChanged,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.label,
          ),
          focusNode: foucsNodeEmail,
        ),
      ),
    );
  }
}
