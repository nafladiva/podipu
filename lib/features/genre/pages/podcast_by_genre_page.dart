import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/genre/cubit/genre_cubit.dart';
import 'package:podipu/shared/data/models/genre_mdl.dart';
import 'package:podipu/shared/widgets/my_app_bar.dart';

import 'widgets/podcast_genre_card.dart';
import 'widgets/podcast_genre_loader.dart';

class PodcastByGenrePage extends StatelessWidget {
  const PodcastByGenrePage({
    super.key,
    required this.genre,
  });

  final GenreMdl genre;

  @override
  Widget build(BuildContext context) {
    final genreCubit = context.read<GenreCubit>();
    genreCubit.getPodcastsByGenre(genre);

    return Scaffold(
      appBar: const MyAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: SizeConst.kMarginY,
            horizontal: SizeConst.kMarginX,
          ),
          child: BlocBuilder<GenreCubit, GenreState>(
            builder: (context, state) {
              final podcastsByGenre = state.podcastListByGenre ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    genre.name,
                    style: TStyles.h2(),
                  ),
                  Text(
                    'Podcasts with ${genre.name} genres',
                    style: TStyles.sh3(),
                  ),
                  const SizedBox(height: 35),
                  if (state.podcastByGenreLoadStatus.isLoading) ...[
                    const PodcastGenreLoader(),
                  ] else ...[
                    ...podcastsByGenre.map(
                      (podcast) => PodcastGenreCard(podcast: podcast),
                    ),
                  ],
                  const SizedBox(height: 80),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
