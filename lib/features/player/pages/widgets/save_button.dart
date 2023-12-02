import 'package:flutter/material.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.onTap,
    this.isSaved = false,
  });

  final VoidCallback onTap;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSaved ? Icons.check : Icons.add,
              color: isSaved ? MyColor.green : Colors.white70,
            ),
            const SizedBox(width: 10),
            Text(
              isSaved ? 'Episode saved' : 'Save Episode',
              style: TStyles.sh2(
                color: isSaved ? MyColor.green : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
