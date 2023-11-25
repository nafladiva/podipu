import 'package:equatable/equatable.dart';

import 'podcast_mdl.dart';

class EpisodeMdl extends Equatable {
  final String id;
  final String audioUrl;
  final String imageUrl;
  final String title;
  final String description;
  final int audioLengthSec;
  final int pubDateMS;
  final PodcastMdl? podcast;

  const EpisodeMdl({
    required this.id,
    required this.audioUrl,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.audioLengthSec,
    required this.pubDateMS,
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
      pubDateMS: json['pub_date_ms'],
      podcast: json['podcast'] != null
          ? PodcastMdl.fromMap(
              json['podcast'],
            )
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'audio': audioUrl,
      'image': imageUrl,
      'title': title,
      'description': description,
      'audio_length_sec': audioLengthSec,
      'pub_date_ms': pubDateMS,
      if (podcast != null) 'podcast': podcast?.toMap(),
    };
  }

  EpisodeMdl copyWith({
    String? id,
    String? audioUrl,
    String? imageUrl,
    String? title,
    String? description,
    int? audioLengthSec,
    int? pubDateMS,
    PodcastMdl? podcast,
  }) {
    return EpisodeMdl(
      id: id ?? this.id,
      audioUrl: audioUrl ?? this.audioUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      audioLengthSec: audioLengthSec ?? this.audioLengthSec,
      pubDateMS: pubDateMS ?? this.pubDateMS,
      podcast: podcast ?? this.podcast,
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
        pubDateMS,
        podcast,
      ];
}
