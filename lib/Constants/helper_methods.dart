import 'package:timeago/timeago.dart' as timeago;

String dateConvertor({required String dateFromApi}) {
  timeago.setLocaleMessages('en', timeago.EnMessages());
  DateTime apiDate = DateTime.parse(dateFromApi).toLocal();
  String relativeTime = timeago.format(apiDate, locale: 'en');
  if (relativeTime == 'a moment ago') {
    relativeTime = 'Just Now';
  }
  if (relativeTime == 'a day ago') {
    relativeTime = '1 day ago';
  }
  return relativeTime;
}
