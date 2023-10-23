import 'package:flutter/material.dart';
import 'package:podipu/common/themes/text_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: title != null
          ? Text(
              title ?? '',
              maxLines: 1,
              style: TStyles.sh2(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
