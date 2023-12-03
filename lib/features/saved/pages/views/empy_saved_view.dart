import 'package:flutter/material.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/shared/consts/asset_path.dart';

class EmptySavedView extends StatelessWidget {
  const EmptySavedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 4.5,
          ),
          Image.asset(
            AssetPath.imgEmpty,
            width: 170,
          ),
          const SizedBox(height: 18),
          Text(
            'You haven\'t save any episode yet.',
            style: TStyles.p1(),
          ),
          Text(
            'Go save some!',
            style: TStyles.p2(color: MyColor.primaryPink),
          ),
        ],
      ),
    );
  }
}
