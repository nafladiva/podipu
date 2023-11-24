import 'package:flutter/material.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';

class InfoBadge extends StatelessWidget {
  const InfoBadge({
    super.key,
    required this.text,
    this.icon,
  });

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: MyColor.text.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon!,
              size: 16,
            ),
            const SizedBox(width: 4.0),
          ],
          Text(
            text,
            style: TStyles.p3(),
          )
        ],
      ),
    );
  }
}
