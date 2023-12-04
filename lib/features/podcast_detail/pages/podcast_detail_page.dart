import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/podcast_detail/repositories/podcast_detail_repository.dart';
import 'package:podipu/features/saved/repositories/saved_repository.dart';
import 'package:podipu/shared/extensions/string_ext.dart';
import 'package:podipu/shared/utils/html_util.dart';
import 'package:podipu/shared/utils/image_util.dart';
import 'package:podipu/shared/widgets/my_app_bar.dart';

import '../cubit/podcast_detail_cubit.dart';
import 'widgets/detail_page_loader.dart';
import 'widgets/episode_item.dart';
import 'widgets/info_badge.dart';

class PodcastDetailPage extends StatefulWidget {
  const PodcastDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<PodcastDetailPage> createState() => _PodcastDetailPageState();
}

class _PodcastDetailPageState extends State<PodcastDetailPage> {
  late PodcastDetailCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = PodcastDetailCubit(
      repository: PodcastDetailRepositoryImpl(),
      savedRepository: SavedRepositoryImpl(),
    );
    cubit.onBuild(id: widget.id);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: const MyAppBar(),
        body: SafeArea(
          child: BlocBuilder<PodcastDetailCubit, PodcastDetailState>(
            builder: (context, state) {
              if (state.podcastDetailLoadStatus.isLoading) {
                return const DetailPageLoader();
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SizeConst.kMarginX,
                    vertical: SizeConst.kMarginY,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: ImageUtil.buildCachedNetworkImage(
                              url: state.podcast?.imageUrl ?? '',
                              width: 120.0,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.podcast?.title ?? '',
                                  style: TStyles.sh1(),
                                ),
                                const SizedBox(height: 6.0),
                                Text(
                                  state.podcast?.publisher ?? '',
                                  style: TStyles.p2(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        '🎯 ABOUT THIS PODCAST',
                        style: TStyles.sh1(),
                      ),
                      HtmlUtil.build(
                        html: state.podcast?.description ?? '',
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          InfoBadge(
                            text: state.podcast?.language ?? '',
                            icon: Icons.language,
                          ),
                          InfoBadge(
                            text: state.podcast?.country ?? '',
                            icon: Icons.location_on,
                          ),
                          // const InfoBadge(
                          //   text: 'Daily',
                          //   icon: Icons.update,
                          // ),
                          InfoBadge(
                            text: (state.podcast?.type ?? '').capitalize(),
                            icon: Icons.info,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      const Divider(),
                      const SizedBox(height: 12.0),
                      Text(
                        '🔥 LATEST EPISODE',
                        style: TStyles.sh1(),
                      ),
                      const SizedBox(height: 12.0),
                      EpisodeItem(
                        episode: state.latestEpisode
                            .copyWith(podcast: state.podcast),
                        isSaved: state.isEpisodeSaved(state.latestEpisode.id),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        '📒 PREVIOUS EPISODES',
                        style: TStyles.sh1(),
                      ),
                      const SizedBox(height: 12.0),
                      ...state.podcast!.episodes!.skip(1).map(
                            (episode) => EpisodeItem(
                              episode: episode.copyWith(podcast: state.podcast),
                              isSaved: state.isEpisodeSaved(episode.id),
                            ),
                          ),
                      const SizedBox(height: 65.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
