import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';
import 'package:podipu/features/recent_played/cubit/recent_played_cubit.dart';
import 'package:podipu/features/saved/cubit/saved_cubit.dart';
import 'package:podipu/injection.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/widgets/my_app_bar.dart';
import 'package:rxdart/rxdart.dart';

import 'widgets/seek_bar_widget.dart';
import 'widgets/control_buttons.dart';
import 'widgets/save_button.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({
    super.key,
    required this.episode,
    this.latestTimestamp,
  });

  final EpisodeMdl episode;
  final Duration? latestTimestamp;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final _player = locator<AudioPlayer>();

  @override
  void initState() {
    super.initState();

    final playerCubit = BlocProvider.of<PodcastPlayerCubit>(context);
    final recentPlayedCubit = BlocProvider.of<RecentPlayedCubit>(context);
    final savedCubit = BlocProvider.of<SavedCubit>(context);

    playerCubit.setBackgroundColor(widget.episode.imageUrl);
    playerCubit.initAudio(
      _player,
      episode: widget.episode,
      latestPosition: widget.latestTimestamp,
      onStopPreviousAudio: (prevEpisode, prevPosition) async {
        if (prevEpisode != null) {
          await recentPlayedCubit.saveLatestTimestamp(
            episode: prevEpisode,
            latestTimestamp: prevPosition,
          );
        }
      },
      callback: () async {
        await recentPlayedCubit.setToRecentPlayed(episode: widget.episode);

        final isSaved = await savedCubit.checkEpisodeSavedStatus(
          episode: widget.episode,
        );
        playerCubit.setSavedStatus(isSaved);
      },
    );
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodcastPlayerCubit, PodcastPlayerState>(
      bloc: context.read<PodcastPlayerCubit>(),
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(
            title: widget.episode.podcast?.publisher ?? '',
            backgroundColor: state.backgroundColor,
          ),
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: state.backgroundColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      MyColor.dark,
                    ],
                    begin: FractionalOffset(0.0, 0.3),
                    end: FractionalOffset(0.0, 1.3),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: SizeConst.kMarginY,
                    horizontal: SizeConst.kMarginX + 12.0,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: widget.episode.imageUrl,
                          placeholder: (_, __) =>
                              const CircularProgressIndicator(),
                          errorWidget: (_, __, ___) => const Icon(Icons.error),
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        widget.episode.title,
                        textAlign: TextAlign.center,
                        style: TStyles.sh1(),
                      ),
                      const SizedBox(height: 10),
                      ControlButtons(
                        player: _player,
                      ),
                      // SeekBar(
                      //   semanticsValue: '',
                      //   progresseight: 10,
                      //   indicatorRadius: 0.0,
                      //   value: 14.0,
                      //   progressColor: state.backgroundColor.withOpacity(0.5),
                      //   backgroundColor: MyColor.text.withOpacity(0.7),
                      // ),
                      StreamBuilder<PositionData>(
                        stream: _positionDataStream,
                        builder: (context, snapshot) {
                          final positionData = snapshot.data;

                          return SeekBar(
                            duration: positionData?.duration ?? Duration.zero,
                            position: positionData?.position ?? Duration.zero,
                            bufferedPosition:
                                positionData?.bufferedPosition ?? Duration.zero,
                            onChangeEnd: _player.seek,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 45,
                child: BlocBuilder<PodcastPlayerCubit, PodcastPlayerState>(
                  builder: (context, state) {
                    return SaveButton(
                      isSaved: state.isSaved,
                      isLoading: state.loadStatus.isLoading,
                      onTap: () {
                        final savedCubit = context.read<SavedCubit>();
                        final playerCubit = context.read<PodcastPlayerCubit>();

                        if (state.isSaved) {
                          savedCubit.removeFromSaved(episode: widget.episode);
                        } else {
                          savedCubit.saveEpisode(episode: widget.episode);
                        }
                        playerCubit.setSavedStatus(!state.isSaved);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
