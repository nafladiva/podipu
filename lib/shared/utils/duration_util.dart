class DurationUtil {
  static String formatSeconds(int seconds) {
    final duration = Duration(seconds: seconds);

    final formattedHours = duration.inHours.toString().padLeft(2, '0');
    final formattedMinutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final formattedSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes:$formattedSeconds';
  }
}
