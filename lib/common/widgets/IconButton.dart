import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomnIconsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;

  const CustomnIconsButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      enableFeedback: false,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
