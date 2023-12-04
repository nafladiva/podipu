import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';
import 'package:podipu/features/player/player.dart';
import 'package:podipu/features/saved/cubit/saved_cubit.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/utils/image_util.dart';

import 'saved_card_options.dart';

class SavedCard extends StatefulWidget {
  const SavedCard({
    super.key,
    required this.episode,
    this.latestTimestamp,
  });

  final EpisodeMdl episode;
  final Duration? latestTimestamp;

  @override
  State<SavedCard> createState() => _SavedCardState();
}

class _SavedCardState extends State<SavedCard> {
  bool isShowDelete = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => PersistentNavBarNavigator.pushDynamicScreen(
          context,
          screen: MaterialPageRoute(
            builder: (_) => PlayerPage(
              episode: widget.episode,
              latestTimestamp: widget.latestTimestamp,
            ),
            fullscreenDialog: true,
          ),
          withNavBar: false,
        ),
        onLongPress: () {
          setState(() {
            isShowDelete = !isShowDelete;
          });
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: ImageUtil.buildCachedNetworkImage(
                      url: widget.episode.imageUrl,
                      width: 70.0,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.episode.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TStyles.sh2(),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.episode.podcast?.publisher ?? '',
                          style: TStyles.p1(color: MyColor.primaryPink),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (isShowDelete) ...[
              SavedCardOptions(
                onDelete: () {
                  BlocProvider.of<SavedCubit>(context)
                      .removeFromSaved(episode: widget.episode);
                  BlocProvider.of<PodcastPlayerCubit>(context)
                      .setSavedStatus(false);

                  setState(() => isShowDelete = false);
                },
                onCancel: () {
                  setState(() => isShowDelete = false);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
