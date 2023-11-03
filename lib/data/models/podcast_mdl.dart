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
  final List<EpisodeMdl> episodes;

  const PodcastMdl({
    required this.id,
    required this.imageUrl,
    required this.publisher,
    required this.title,
    required this.description,
    required this.language,
    required this.country,
    required this.type,
    required this.updateFrequencyHours,
    required this.episodes,
  });

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
