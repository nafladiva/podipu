import 'package:equatable/equatable.dart';

class EpisodeMdl extends Equatable {
  final String id;
  final String audioUrl;
  final String imageUrl;
  final String title;
  final String description;
  final int audioLengthSec;

  const EpisodeMdl({
    required this.id,
    required this.audioUrl,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.audioLengthSec,
  });

  @override
  List<Object?> get props => [
        id,
        audioUrl,
        imageUrl,
        title,
        description,
        audioLengthSec,
      ];
}
