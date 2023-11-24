import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/features/player/player.dart';
import 'package:podipu/shared/data/dummy_data.dart';
import 'package:podipu/shared/utils/date_time_util.dart';
import 'package:podipu/shared/utils/duration_util.dart';
import 'package:podipu/shared/widgets/my_shimmer_loader.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({
    super.key,
    required this.episode,
  });

  final EpisodeMdl? episode;

  @override
  Widget build(BuildContext context) {
    if (episode == null) {
      return const SizedBox();
    }

    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  color: MyColor.text.withOpacity(0.1),
                  child: CachedNetworkImage(
                    imageUrl: episode!.imageUrl,
                    placeholder: (_, __) => const MyShimmerLoader(
                      width: 60.0,
                      height: 60.0,
                    ),
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode!.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TStyles.p1().copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      DateTimeUtil.millisecondsToDateTime(episode!.pubDateMS),
                      style: TStyles.p3(),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 6),
          const Divider(),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                DurationUtil.formatSeconds(episode!.audioLengthSec),
                style: TStyles.p1(),
              ),
              const SizedBox(width: 6.0),
              InkWell(
                onTap: () => PersistentNavBarNavigator.pushDynamicScreen(
                  context,
                  screen: MaterialPageRoute(
                    builder: (_) => PlayerPage(podcast: DummyData.datas.first),
                    fullscreenDialog: true,
                  ),
                  withNavBar: false,
                ),
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.dark,
                    boxShadow: [
                      BoxShadow(
                        color: MyColor.shadow.withOpacity(0.2),
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 28,
                    color: MyColor.primaryPink,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
