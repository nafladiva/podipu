import 'package:podipu/shared/consts/asset_path.dart';
import 'package:podipu/shared/models/podcast.dart';

class DummyData {
  static const List<Podcast> datas = [
    Podcast(
      title: 'Starboy',
      artist: 'The Weeknd',
      coverPath: AssetPath.starboyCoverImg,
      audioPath: AssetPath.starboyAudio,
    ),
    Podcast(
      title: 'Snooze',
      artist: 'SZA',
      coverPath: AssetPath.snoozeCoverImg,
      audioPath: AssetPath.snoozeAudio,
    ),
    Podcast(
      title: 'Tally',
      artist: 'Blackpink',
      coverPath: AssetPath.tallyCoverImg,
      audioPath: AssetPath.tallyAudio,
    ),
    Podcast(
      title: 'The Hills',
      artist: 'The Weeknd',
      coverPath: AssetPath.theHillsCoverImg,
      audioPath: AssetPath.theHillsAudio,
    ),
    Podcast(
      title: 'Try Me',
      artist: 'The Weeknd',
      coverPath: AssetPath.tryMeCoverImg,
      audioPath: AssetPath.tryMeAudio,
    ),
  ];
}
