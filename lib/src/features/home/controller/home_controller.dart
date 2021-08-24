String convertDurationCountdown(Duration duration) {
  final int differenceInSec = duration.inSeconds;

  final int hour = (differenceInSec / 3600).floor();
  final int remaining = (differenceInSec % 3600);
  final int min = (remaining / 60).floor();
  final int sec = remaining % 60;

  final String hourInString = hour < 10 ? '0$hour' : hour.toString();
  final String minInString = min < 10 ? '0$min' : min.toString();
  final String secInString = sec < 10 ? '0$sec' : sec.toString();

  return '$hourInString:$minInString:$secInString';
}
