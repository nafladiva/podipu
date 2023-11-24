import 'package:equatable/equatable.dart';

import 'episode_mdl.dart';

class PodcastMdl extends Equatable {
  final String id;
  final String imageUrl;
  final String publisher;
  final String title;
  final String description;
  final String language;
  final String country;
  final String type;
  final int updateFrequencyHours;
  final List<EpisodeMdl>? episodes;

  const PodcastMdl({
    required this.id,
    required this.imageUrl,
    required this.publisher,
    required this.title,
    this.description = '',
    this.language = '',
    this.country = '',
    this.type = '',
    this.updateFrequencyHours = 0,
    this.episodes,
  });

  factory PodcastMdl.fromMap(Map<String, dynamic> json) {
    return PodcastMdl(
      id: json['id'],
      imageUrl: json['image'],
      publisher: json['publisher'],
      title: json['title'],
      description: json['description'] ?? '',
      language: json['language'] ?? '',
      country: json['country'] ?? '',
      type: json['type'] ?? '',
      updateFrequencyHours: json['update_frequency_hours'] ?? 0,
      episodes: json['episodes'] != null
          ? List<EpisodeMdl>.from(
              json['episodes'].map((x) => EpisodeMdl.fromMap(x)),
            )
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        publisher,
        title,
        description,
        language,
        country,
        type,
        updateFrequencyHours,
        episodes,
      ];
}
