import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/player.dart';
import 'package:podipu/shared/utils/image_util.dart';

import '../../cubit/home_cubit.dart';
import '../widgets/just_lister_loader.dart';

class JustListenView extends StatelessWidget {
  const JustListenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.randomEpisode == null) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Just Listen 🎧',
                style: TStyles.sh2(),
              ),
              const SizedBox(height: 12),
              if (state.randomEpisodeLoadStatus.isLoading) ...[
                const JustListenLoader(),
              ] else ...[
                InkWell(
                  onTap: () => PersistentNavBarNavigator.pushDynamicScreen(
                    context,
                    screen: MaterialPageRoute(
                      builder: (_) => PlayerPage(episode: state.randomEpisode!),
                      fullscreenDialog: true,
                    ),
                    withNavBar: false,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ImageUtil.buildCachedNetworkImage(
                          url: state.randomEpisode!.imageUrl,
                          width: 110.0,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.randomEpisode!.podcast?.title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TStyles.sh2(),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              state.randomEpisode!.title,
                              style: TStyles.p2(),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              state.randomEpisode!.podcast?.publisher ?? '',
                              style: TStyles.p1(color: MyColor.primaryPink),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
