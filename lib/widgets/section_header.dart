import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:iconly/iconly.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isVisibale,
  });
  final String text;
  final Function onPressed;
  final bool isVisibale;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20,
            width: 4,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: const Color(0xFF343434)),
          ),
          Text(
            text,
            style: const TextStyle().copyWith(
              fontSize: 17.0,
            ),
          ),
          const Spacer(),
          CupertinoButton(
            onPressed: onPressed as void Function()?,
            child: Visibility(
              visible: isVisibale,
              child: const Icon(
                IconlyBroken.arrow_right_2,
                color: material.Colors.lightBlue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
