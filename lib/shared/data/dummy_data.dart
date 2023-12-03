import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
import 'package:podipu/shared/consts/asset_path.dart';
import 'package:podipu/shared/data/models/podcast.dart';

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

  static const podcast = PodcastMdl(
    id: '4d3fe717742d4963a85562e9f84d8c79',
    imageUrl:
        'https://production.listennotes.com/podcasts/star-wars-7x7-the-daily-star-wars-podcast-HN08OoDE7pc-AIg3cZVKCsL.1400x1400.jpg',
    publisher: 'Star Wars 7x7',
    title: 'Star Wars 7x7: A Daily Bite-Sized Dose of Star Wars Joy',
    description:
        'The Star Wars 7x7 Podcast is Rebel-rousing fun for everyday Jedi, generally between 7 and 14 minutes a day, always 7 days a week. Join host Allen Voivod for Star Wars news, history, interviews, trivia, and deep dives into the Star Wars story as told in movies, books, comics, games, cartoons, and more. Follow now for your daily dose of Star Wars joy. It\'s destiny unleashed! #SW7x7',
    language: 'English',
    country: 'United States',
    type: 'episodic',
    updateFrequencyHours: 24,
    episodes: <EpisodeMdl>[
      EpisodeMdl(
        id: '4e7c59e10e4640b98f2f3cb1777dbb43',
        audioUrl:
            'https://www.listennotes.com/e/p/4e7c59e10e4640b98f2f3cb1777dbb43/',
        imageUrl:
            'https://production.listennotes.com/podcasts/star-wars-7x7-the/864-part-2-of-my-new--vDBMTjY_mK-2WVsxtU0f3m.600x315.jpg',
        title: '864: Part 2 of My (New) Conversation With Bobby Roberts',
        description:
            "<p>The second half of my latest conversation with Bobby Roberts, Podcast Emeritus from Full of Sith and now Star Wars \"Podcast Force Ghost at Large.\" Punch it!</p> <p>***We’re listener supported! Go to http://Patreon.com/sw7x7 to donate to the Star Wars 7x7 podcast, and you’ll get some fabulous rewards for your pledge.*** </p> <p>Check out SW7x7.com for full Star Wars 7x7 show notes and links, and to comment on any of the content of this episode! If you like what you've heard, please leave us a rating or review on iTunes or Stitcher, which will also help more people discover this Star Wars podcast.</p> <p>Don't forget to join the Star Wars 7x7 fun on Facebook at Facebook.com/SW7x7, and follow the breaking news Twitter feed at Twitter.com/SW7x7Podcast. We're also on Pinterest and Instagram as \"SW7x7\" too, and we'd love to connect with you there!</p>",
        audioLengthSec: 2447,
        pubDateMS: 123,
      ),
      // EpisodeMdl(
      //   id: '9ae0e2e49a9c477191263df90adf7f3e',
      //   audioUrl:
      //       'https://www.listennotes.com/e/p/9ae0e2e49a9c477191263df90adf7f3e/',
      //   imageUrl:
      //       'https://production.listennotes.com/podcasts/star-wars-7x7-the/863-a-new-conversation-with-e_vHo9SM7ft-0YRBTlgiVeU.600x315.jpg',
      //   title: '863: A (New) Conversation With Bobby Roberts, Part 1',
      //   description:
      //       "<p>An in-depth conversation about the Star Wars \"Story\" movies and so much more, featuring Bobby Roberts, Star Wars \"Podcast Force Ghost at Large.\" Punch it!</p> <p>***We’re listener supported! Go to http://Patreon.com/sw7x7 to donate to the Star Wars 7x7 podcast, and you’ll get some fabulous rewards for your pledge.*** </p> <p>Check out SW7x7.com for full Star Wars 7x7 show notes and links, and to comment on any of the content of this episode! If you like what you've heard, please leave us a rating or review on iTunes or Stitcher, which will also help more people discover this Star Wars podcast.</p> <p>Don't forget to join the Star Wars 7x7 fun on Facebook at Facebook.com/SW7x7, and follow the breaking news Twitter feed at Twitter.com/SW7x7Podcast. We're also on Pinterest and Instagram as \"SW7x7\" too, and we'd love to connect with you there!</p>",
      //   audioLengthSec: 2916,
      // ),
      // EpisodeMdl(
      //   id: '98bcfa3fd1b44727913385938788bcc5',
      //   audioUrl:
      //       'https://www.listennotes.com/e/p/98bcfa3fd1b44727913385938788bcc5/',
      //   imageUrl:
      //       'https://production.listennotes.com/podcasts/star-wars-7x7-the/862-assassin-clone-wars-lP94b2q5iOz-jEcMAdTntzs.600x315.jpg',
      //   title: "862: \"Assassin\" - Clone Wars Briefing, Season 3, Episode 7",
      //   description:
      //       "<p>The beginnings of the true power of the Force, revealed in \"Assassin,\" season 3, episode 7 of the Star Wars: The Clone Wars cartoon series. Punch it!</p> <p>***We’re listener supported! Go to http://Patreon.com/sw7x7 to donate to the Star Wars 7x7 podcast, and you’ll get some fabulous rewards for your pledge.*** </p> <p>Check out SW7x7.com for full Star Wars 7x7 show notes and links, and to comment on any of the content of this episode! If you like what you've heard, please leave us a rating or review on iTunes or Stitcher, which will also help more people discover this Star Wars podcast.</p> <p>Don't forget to join the Star Wars 7x7 fun on Facebook at Facebook.com/SW7x7, and follow the breaking news Twitter feed at Twitter.com/SW7x7Podcast. We're also on Pinterest and Instagram as \"SW7x7\" too, and we'd love to connect with you there!</p>",
      //   audioLengthSec: 636,
      // ),
      // EpisodeMdl(
      //   id: '61d1de72f97e48e887c5d6280d3de384',
      //   audioUrl:
      //       'https://www.listennotes.com/e/p/61d1de72f97e48e887c5d6280d3de384/',
      //   imageUrl:
      //       'https://production.listennotes.com/podcasts/star-wars-7x7-the/861-rogue-one-international-6rZOEiJHPpx-nGxaRC95V6o.600x315.jpg',
      //   title: "861: Rogue One International Trailer Breakdown",
      //   description:
      //       "<p>Surprise! An international trailer for Rogue One has dropped, and it includes new scenes, new dialogue, and some heavy foreshadowing about Jyn Erso's fate. Punch it!</p> <p>***We’re listener supported! Go to http://Patreon.com/sw7x7 to donate to the Star Wars 7x7 podcast, and you’ll get some fabulous rewards for your pledge.*** </p> <p>Check out SW7x7.com for full Star Wars 7x7 show notes and links, and to comment on any of the content of this episode! If you like what you've heard, please leave us a rating or review on iTunes or Stitcher, which will also help more people discover this Star Wars podcast.</p> <p>Don't forget to join the Star Wars 7x7 fun on Facebook at Facebook.com/SW7x7, and follow the breaking news Twitter feed at Twitter.com/SW7x7Podcast. We're also on Pinterest and Instagram as \"SW7x7\" too, and we'd love to connect with you there!</p>",
      //   audioLengthSec: 1082,
      // ),
    ],
  );
}
