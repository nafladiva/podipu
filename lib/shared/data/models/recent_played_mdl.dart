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
      latestTimestamp: Duration(milliseconds: json['latest_time_stamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'episode': episode.toMap(),
      'played_at': playedAt.toIso8601String(),
      'latest_time_stamp': latestTimestamp?.inMilliseconds ?? 0,
    };
  }

  RecentPlayedMdl copyWith({
    EpisodeMdl? episode,
    DateTime? playedAt,
    Duration? latestTimestamp,
  }) {
    return RecentPlayedMdl(
      episode: episode ?? this.episode,
      playedAt: playedAt ?? this.playedAt,
      latestTimestamp: latestTimestamp ?? this.latestTimestamp,
    );
  }

  @override
  List<Object?> get props => [episode, playedAt, latestTimestamp];
}
