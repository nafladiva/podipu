import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_seekbar/flutter_seekbar.dart' show SeekBar;
import 'package:just_audio/just_audio.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';
import 'package:podipu/injection.dart';
import 'package:podipu/data/models/podcast.dart';
import 'package:podipu/shared/widgets/my_app_bar.dart';
import 'package:rxdart/rxdart.dart';

import '../common/player_common.dart';
import '../widgets/control_buttons.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({
    super.key,
    required this.podcast,
  });

  final Podcast podcast;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final _player = locator<AudioPlayer>();

  @override
  void initState() {
    super.initState();

    final playerCubit = BlocProvider.of<PodcastPlayerCubit>(context);
    playerCubit.setBackgroundColor(widget.podcast.coverPath);
    playerCubit.initAudio(_player, podcast: widget.podcast);
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
  void dispose() {
    // _player.dispose();
    // playerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodcastPlayerCubit, PodcastPlayerState>(
      bloc: context.read<PodcastPlayerCubit>(),
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(
            title: widget.podcast.artist,
            backgroundColor: state.backgroundColor,
          ),
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: state.backgroundColor,
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: SizeConst.kMarginY,
                    horizontal: SizeConst.kMarginX + 12.0,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(widget.podcast.coverPath),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        widget.podcast.title,
                        style: TStyles.sh1(),
                      ),
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
            ],
          ),
        );
      },
    );
  }
}
