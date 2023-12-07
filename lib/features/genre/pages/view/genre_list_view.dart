import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/genre/cubit/genre_cubit.dart';

import '../widgets/genre_chip.dart';
import '../widgets/genre_list_loader.dart';

class GenreListView extends StatelessWidget {
  const GenreListView({super.key});

  @override
  Widget build(BuildContext context) {
    final genreCubit = context.read<GenreCubit>();

    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Podcast Genres',
                    style: TStyles.sh2(),
                  ),
                  GestureDetector(
                    onTap: genreCubit.onBuild,
                    child: Text(
                      'Refresh',
                      style: TStyles.p1(color: MyColor.primaryPink),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              if (state.genreListloadStatus.isLoading) ...[
                const GenreListLoader(),
              ] else ...[
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ...state.genreList.map(
                      (genre) => GenreChip(
                        genre: genre,
                      ),
                    ),
                  ],
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
