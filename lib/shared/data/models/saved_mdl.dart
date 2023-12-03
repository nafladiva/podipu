import 'package:equatable/equatable.dart';

import 'episode_mdl.dart';

class SavedMdl extends Equatable {
  final EpisodeMdl episode;
  final Duration? latestTimestamp;

  const SavedMdl({
    required this.episode,
    this.latestTimestamp,
  });

  factory SavedMdl.fromMap(Map<String, dynamic> json) {
    return SavedMdl(
      episode: EpisodeMdl.fromMap(
        json['episode'],
      ),
      latestTimestamp: Duration(milliseconds: json['latest_time_stamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'episode': episode.toMap(),
      'latest_time_stamp': latestTimestamp?.inMilliseconds ?? 0,
    };
  }

  SavedMdl copyWith({
    EpisodeMdl? episode,
    Duration? latestTimestamp,
  }) {
    return SavedMdl(
      episode: episode ?? this.episode,
      latestTimestamp: latestTimestamp ?? this.latestTimestamp,
    );
  }

  @override
  List<Object?> get props => [episode, latestTimestamp];
}
