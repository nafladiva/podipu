import 'package:flutter/material.dart';
import 'package:podipu/common/themes/text_styles.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
  });

  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0.5,
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: TStyles.sh2(),
      ),
    );
  }
}
