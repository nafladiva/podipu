import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/genre/cubit/genre_cubit.dart';
import 'package:podipu/features/genre/pages/widgets/genre_chip.dart';
import 'package:podipu/shared/data/models/genre_mdl.dart';

import '../podcast_by_genre_page.dart';

class GenreSearchBar extends StatelessWidget {
  const GenreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GenreCubit>();

    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SizeConst.kMarginX,
              ),
              child: TypeAheadField<GenreMdl>(
                itemBuilder: (context, genre) {
                  return ListTile(
                    title: Text(
                      genre.name,
                      style: TStyles.sh3(),
                    ),
                  );
                },
                suggestionsCallback: (query) async {
                  if (query.isNotEmpty) {
                    return await cubit.search(query);
                  }

                  return [];
                },
                onSuggestionSelected: (suggestion) {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: PodcastByGenrePage(genre: suggestion),
                  );
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.15),
                    hintText: 'Search genre',
                    hintStyle: TStyles.p1(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: MyColor.primaryPink,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  ...state.genreList.map(
                    (genre) => GenreChip(genre: genre),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
