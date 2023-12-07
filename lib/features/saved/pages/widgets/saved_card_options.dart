import 'package:flutter/material.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/shared/widgets/my_button.dart';

class SavedCardOptions extends StatelessWidget {
  const SavedCardOptions({
    super.key,
    required this.onDelete,
    required this.onCancel,
  });

  final VoidCallback onDelete;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyColor.dark.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.35),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  text: 'Delete',
                  backgroundColor: Colors.red,
                  onTap: onDelete,
                ),
                const SizedBox(width: 20),
                MyButton(
                  text: 'Cancel',
                  backgroundColor: Colors.grey,
                  onTap: onCancel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
