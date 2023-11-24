import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';

import '../../cubit/home_cubit.dart';

class JustListenView extends StatelessWidget {
  const JustListenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.randomEpisodeLoadStatus.isLoading) {
          return const CircularProgressIndicator();
        }

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
              InkWell(
                onTap: () {
                  // TODO: open player
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: state.randomEpisode!.imageUrl,
                        placeholder: (_, __) =>
                            const CircularProgressIndicator(),
                        errorWidget: (_, __, ___) => const Icon(Icons.error),
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
          ),
        );
      },
    );
  }
}
