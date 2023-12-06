import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';

import '../cubit/saved_cubit.dart';
import 'views/empy_saved_view.dart';
import 'widgets/saved_card.dart';
import 'widgets/saved_list_loader.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: SizeConst.kMarginY,
            horizontal: SizeConst.kMarginX,
          ),
          child: BlocBuilder<SavedCubit, SavedState>(
            builder: (context, state) {
              final isEmpty = state.savedList.isEmpty;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your saved💫',
                    style: TStyles.h1(),
                  ),
                  Text(
                    'list of episodes that you saved',
                    style: TStyles.p1(),
                  ),
                  const SizedBox(height: 35),
                  if (state.loadStatus.isLoading) ...[
                    const SaveListLoader(),
                  ] else ...[
                    if (isEmpty) ...[
                      const EmptySavedView(),
                    ] else ...[
                      ...state.savedList.map(
                        (saved) => SavedCard(
                          episode: saved.episode,
                          latestTimestamp: saved.latestTimestamp,
                        ),
                      ),
                    ],
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
