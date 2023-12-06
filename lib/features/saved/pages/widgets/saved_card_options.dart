import 'package:flutter/material.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';

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
                ElevatedButton(
                  onPressed: onDelete,
                  style: ElevatedButton.styleFrom(
                    elevation: 0.5,
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Delete',
                    style: TStyles.sh2(),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                    elevation: 0.5,
                    backgroundColor: Colors.grey,
                  ),
                  child: Text(
                    'Cancel',
                    style: TStyles.sh2(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
