import 'package:googleapis/calendar/v3.dart' as calendar;

String? extractMeetingLink(calendar.Event event) {
  if (event.hangoutLink != null) return event.hangoutLink;

  if (event.conferenceData?.entryPoints != null) {
    for (var entryPoint in event.conferenceData!.entryPoints!) {
      if (entryPoint.uri != null &&
          (entryPoint.entryPointType == 'video' ||
              entryPoint.uri!.contains('meet.google.com') ||
              entryPoint.uri!.contains('zoom.us'))) {
        return entryPoint.uri;
      }
    }
  }

  if (event.description != null) {
    final urlRegex = RegExp(
      r'(https?:\/\/(?:www\.)?(?:meet\.google\.com|zoom\.us|teams\.microsoft\.com)\/[^\s]+)',
      caseSensitive: false,
    );
    final match = urlRegex.firstMatch(event.description!);
    if (match != null) return match.group(0);
  }

  return null;
}
