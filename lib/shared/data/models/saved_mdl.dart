import 'package:equatable/equatable.dart';

import 'episode_mdl.dart';

class SavedMdl extends Equatable {
  final EpisodeMdl episode;
  final DateTime savedAt;
  final Duration? latestTimestamp;

  const SavedMdl({
    required this.episode,
    required this.savedAt,
    this.latestTimestamp,
  });

  factory SavedMdl.fromMap(Map<String, dynamic> json) {
    return SavedMdl(
      episode: EpisodeMdl.fromMap(
        json['episode'],
      ),
      savedAt: DateTime.parse(json['saved_at']),
      latestTimestamp: Duration(milliseconds: json['latest_time_stamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'episode': episode.toMap(),
      'saved_at': savedAt.toIso8601String(),
      'latest_time_stamp': latestTimestamp?.inMilliseconds ?? 0,
    };
  }

  SavedMdl copyWith({
    EpisodeMdl? episode,
    DateTime? savedAt,
    Duration? latestTimestamp,
  }) {
    return SavedMdl(
      episode: episode ?? this.episode,
      savedAt: savedAt ?? this.savedAt,
      latestTimestamp: latestTimestamp ?? this.latestTimestamp,
    );
  }

  @override
  List<Object?> get props => [episode, savedAt, latestTimestamp];
}
