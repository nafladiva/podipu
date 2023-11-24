import 'package:equatable/equatable.dart';

class Podcast extends Equatable {
  final int id;
  final String title;
  final String artist;
  final String coverPath;
  final String audioPath;

  const Podcast({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverPath,
    required this.audioPath,
  });

  @override
  List<Object?> get props => [id, title, artist, coverPath, audioPath];
}
