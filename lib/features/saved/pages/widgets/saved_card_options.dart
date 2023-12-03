import 'package:flutter/material.dart';
import 'package:podipu/common/themes/colors.dart';

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
                InkWell(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.delete_outline,
                    size: 32,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 30),
                InkWell(
                  onTap: onCancel,
                  child: const Icon(
                    Icons.close,
                    size: 32,
                    color: MyColor.text,
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
