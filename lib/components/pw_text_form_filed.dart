import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PwTextFormField extends StatefulWidget {
  PwTextFormField({
    super.key,
    required this.label,
    this.onChanged,
  });
  final String label;

  Function(String)? onChanged;
  @override
  State<PwTextFormField> createState() => _PwTextFormFieldState();
}

class _PwTextFormFieldState extends State<PwTextFormField> {
  late bool passToggle = true;
  var foucsNodePassword = FocusNode();
  bool isFocusedPassword = false;

  @override
  void initState() {
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
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
            color: isFocusedPassword ? Colors.white : const Color(0xFFF1F0F5),
            border: Border.all(
              width: 1,
              color: const Color(0xFFD2D2D4),
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (isFocusedPassword)
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 90, 146, 184).withOpacity(.3),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                )
            ]),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter an password';
            }
            return null;
          },
          onChanged: widget.onChanged,
          obscureText: passToggle ? true : false,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                if (passToggle == true) {
                  passToggle = false;
                } else {
                  passToggle = true;
                }
                setState(() {});
              },
              child: passToggle
                  ? const Icon(
                      CupertinoIcons.eye_slash_fill,
                      color: Colors.grey,
                      size: 20,
                    )
                  : const Icon(
                      CupertinoIcons.eye_fill,
                      color: Colors.grey,
                      size: 20,
                    ),
            ),
            border: InputBorder.none,
            hintText: widget.label,
          ),
          focusNode: foucsNodePassword,
        ),
      ),
    );
  }
}
