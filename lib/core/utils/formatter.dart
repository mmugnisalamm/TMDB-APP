class Formatter {
  String formatRuntime(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0) {
      return '${hours}j ${mins}m';
    }
    return '${mins}m';
  }
}
