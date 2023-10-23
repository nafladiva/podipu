import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as au;
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/cubits/player/player_cubit.dart';
import 'package:podipu/shared/widgets/my_app_bar.dart';

import '../widgets/control_buttons.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final imagePath = 'assets/images/starboy-cover.jpeg';
  final audioPathTemp =
      'https://diviextended.com/wp-content/uploads/2021/10/sound-of-waves-marine-drive-mumbai.mp3';
  final backgroundColor = MyColor.background;
  final playerCubit = PlayerCubit();
  final _player = au.AudioPlayer();

  @override
  void initState() {
    super.initState();
    playerCubit.setBackgroundColor(imagePath);
  }

//   Stream<PositionData> get _positionDataStream =>
//       Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
//         _player.positionStream,
//         _player.bufferedPositionStream,
//         _player.durationStream,
//         (position, bufferedPosition, duration) =>
//             PositionData(position, bufferedPosition, duration ?? Duration.zero),
//       );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayerCubit(),
      child: BlocBuilder<PlayerCubit, PlayerState>(
        bloc: playerCubit,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.backgroundColor,
            appBar: const MyAppBar(title: 'The Weeknd'),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: SizeConst.kMarginY,
                  horizontal: SizeConst.kMarginX + 12.0,
                ),
                child: Column(
                  children: [
                    Image.asset(imagePath),
                    const SizedBox(height: 28),
                    Text(
                      'Starboy',
                      style: TStyles.sh1(),
                    ),
                    ControlButtons(
                      player: _player,
                    ),
                    // StreamBuilder<PositionData>(
                    //   stream: _positionDataStream,
                    //   builder: (context, snapshot) {
                    //     final positionData = snapshot.data;
                    //     return SeekBar(
                    //       duration: positionData?.duration ?? Duration.zero,
                    //       position: positionData?.position ?? Duration.zero,
                    //       bufferedPosition:
                    //           positionData?.bufferedPosition ?? Duration.zero,
                    //       onChangeEnd: _player.seek,
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
