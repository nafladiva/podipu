extension StringExt on String {
  String capitalize() {
    if (length == 0) return '';

    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
