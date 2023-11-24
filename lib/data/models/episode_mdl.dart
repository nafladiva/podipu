import 'package:equatable/equatable.dart';

import 'podcast_mdl.dart';

class EpisodeMdl extends Equatable {
  final String id;
  final String audioUrl;
  final String imageUrl;
  final String title;
  final String description;
  final int audioLengthSec;
  final PodcastMdl? podcast;

  const EpisodeMdl({
    required this.id,
    required this.audioUrl,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.audioLengthSec,
    this.podcast,
  });

  factory EpisodeMdl.fromMap(Map<String, dynamic> json) {
    return EpisodeMdl(
      id: json['id'],
      audioUrl: json['audio'],
      imageUrl: json['image'],
      title: json['title'],
      description: json['description'],
      audioLengthSec: json['audio_length_sec'],
      podcast: json['podcast'] != null
          ? PodcastMdl.fromMap(
              json['podcast'],
            )
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        audioUrl,
        imageUrl,
        title,
        description,
        audioLengthSec,
        podcast,
      ];
}
