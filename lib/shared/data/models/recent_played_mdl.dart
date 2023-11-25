import 'package:equatable/equatable.dart';

import 'episode_mdl.dart';

class RecentPlayedMdl extends Equatable {
  final EpisodeMdl episode;
  final DateTime playedAt;
  final Duration? latestTimestamp;

  const RecentPlayedMdl({
    required this.episode,
    required this.playedAt,
    this.latestTimestamp,
  });

  factory RecentPlayedMdl.fromMap(Map<String, dynamic> json) {
    return RecentPlayedMdl(
      episode: EpisodeMdl.fromMap(
        json['episode'],
      ),
      playedAt: DateTime.parse(json['played_at']),
      latestTimestamp: Duration(seconds: json['latest_time_stamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'episode': episode.toMap(),
      'played_at': playedAt.toIso8601String(),
      'latest_time_stamp': latestTimestamp?.inSeconds ?? 0,
    };
  }

  @override
  List<Object?> get props => [episode, playedAt, latestTimestamp];
}
