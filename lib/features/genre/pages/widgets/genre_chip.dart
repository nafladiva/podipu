import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/genre/pages/podcast_by_genre_page.dart';
import 'package:podipu/shared/data/models/genre_mdl.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({
    super.key,
    required this.genre,
  });

  final GenreMdl genre;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: PodcastByGenrePage(genre: genre),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: MyColor.primaryPink,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          genre.name,
          style: TStyles.p2(color: MyColor.background)
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
