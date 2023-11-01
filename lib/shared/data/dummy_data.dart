import 'package:podipu/shared/consts/asset_path.dart';
import 'package:podipu/shared/models/podcast.dart';

class DummyData {
  static const List<Podcast> datas = [
    Podcast(
      id: 1,
      title: 'Starboy',
      artist: 'The Weeknd',
      coverPath: AssetPath.starboyCoverImg,
      audioPath: AssetPath.starboyAudio,
    ),
    Podcast(
      id: 2,
      title: 'Snooze',
      artist: 'SZA',
      coverPath: AssetPath.snoozeCoverImg,
      audioPath: AssetPath.snoozeAudio,
    ),
    Podcast(
      id: 3,
      title: 'Tally',
      artist: 'Blackpink',
      coverPath: AssetPath.tallyCoverImg,
      audioPath: AssetPath.tallyAudio,
    ),
    Podcast(
      id: 4,
      title: 'The Hills',
      artist: 'The Weeknd',
      coverPath: AssetPath.theHillsCoverImg,
      audioPath: AssetPath.theHillsAudio,
    ),
    Podcast(
      id: 5,
      title: 'Try Me',
      artist: 'The Weeknd',
      coverPath: AssetPath.tryMeCoverImg,
      audioPath: AssetPath.tryMeAudio,
    ),
  ];
}
