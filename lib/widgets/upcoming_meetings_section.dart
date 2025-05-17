// import 'package:flutter/material.dart';
// import 'package:googleapis/calendar/v3.dart' as calendar;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
// import 'package:ping_me/function/meeting_card.dart';
// import 'package:url_launcher/url_launcher.dart';

// class UpcomingMeetingsScreen extends StatefulWidget {
//   const UpcomingMeetingsScreen({Key? key}) : super(key: key);

//   @override
//   State<UpcomingMeetingsScreen> createState() => _UpcomingMeetingsScreenState();
// }

// class _UpcomingMeetingsScreenState extends State<UpcomingMeetingsScreen> {
//   List<calendar.Event> upcomingEvents = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchUpcomingEvents();
//   }

//   /// -------------------------------
//   /// SECTION 1: FETCH EVENTS
//   /// -------------------------------
//   Future<void> fetchUpcomingEvents() async {
//     try {
//       final client = await getAuthenticatedClient();

//       final calendarApi = calendar.CalendarApi(client);
//       final now = DateTime.now().toUtc();

//       final events = await calendarApi.events.list(
//         "primary",
//         timeMin: now,
//         maxResults: 10,
//         singleEvents: true,
//         orderBy: "startTime",
//         // If using conferenceData, set this
//         // conferenceDataVersion: 1,
//       );

//       setState(() {
//         upcomingEvents = events.items ?? [];
//         isLoading = false;
//       });
//     } catch (e) {
//       debugPrint("Error fetching events: $e");
//       setState(() => isLoading = false);
//     }
//   }

//   /// Replace with your actual OAuth or service account credentials
//   Future<http.Client> getAuthenticatedClient() async {
//     final credentials = ServiceAccountCredentials.fromJson(r'''
//     {
//       "private_key_id": "your_private_key_id",
//       "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n",
//       "client_email": "your_service_account_email@your-project.iam.gserviceaccount.com",
//       "client_id": "your_client_id",
//       "type": "service_account"
//     }
//     ''');

//     final scopes = [calendar.CalendarApi.calendarScope];
//     return await clientViaServiceAccount(credentials, scopes);
//   }

//   /// -------------------------------
//   /// SECTION 2: UI BUILDERS
//   /// -------------------------------
//   // Widget buildMeetingList() {
//   //   return ListView.builder(
//   //     scrollDirection: Axis.horizontal,
//   //     itemCount: upcomingEvents.length,
//   //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//   //     itemBuilder: (context, index) {
//   //       return buildMeetingCard(upcomingEvents[index]);
//   //     },
//   //   );
//   // }

//   // Widget buildMeetingCard(calendar.Event event) {
//   //   final start = event.start?.dateTime?.toLocal() ?? DateTime.now();
//   //   final end = event.end?.dateTime?.toLocal() ?? start.add(const Duration(minutes: 30));
//   //   final isStarted = DateTime.now().isAfter(start) && DateTime.now().isBefore(end);

//   //   final meetingLink = extractMeetingLink(event);

//   //   return Padding(
//   //     padding: const EdgeInsets.only(right: 12),
//   //     child: MeetingCard(
//   //       title: event.summary ?? "No Title",
//   //       time: '${start.hour}:${start.minute.toString().padLeft(2, '0')} - '
//   //             '${end.hour}:${end.minute.toString().padLeft(2, '0')}',
//   //       participants: event.attendees?.length ?? 1,
//   //       isStarted: isStarted,
//   //       // meetingId: event.id ?? "N/A",
//   //       // meetingLink: meetingLink ?? "No Link",
//   //       // onJoin: () {
//   //         if (meetingLink != null) {
//   //           launchUrl(Uri.parse(meetingLink));
//   //         }
//   //       },
//   //     ),
//   //   );
//   // }

//   /// -------------------------------
//   /// SECTION 3: EXTRACT LINK
//   /// -------------------------------
//   String? extractMeetingLink(calendar.Event event) {
//     if (event.hangoutLink != null) return event.hangoutLink;

//     if (event.conferenceData?.entryPoints != null) {
//       for (var entry in event.conferenceData!.entryPoints!) {
//         if (entry.uri != null &&
//             (entry.entryPointType == 'video' ||
//                 entry.uri!.contains('meet.google.com') ||
//                 entry.uri!.contains('zoom.us'))) {
//           return entry.uri;
//         }
//       }
//     }

//     if (event.description != null) {
//       final urlRegex = RegExp(
//         r'(https?:\/\/(?:www\.)?(?:meet\.google\.com|zoom\.us|teams\.microsoft\.com)\/[^\s]+)',
//         caseSensitive: false,
//       );
//       final match = urlRegex.firstMatch(event.description!);
//       if (match != null) return match.group(0);
//     }

//     return null;
//   }

//   /// -------------------------------
//   /// SECTION 4: BUILD SCREEN
//   /// -------------------------------
//   //   @override
//   //   Widget build(BuildContext context) {
//   //     return Scaffold(
//   //       appBar: AppBar(title: const Text("Upcoming Meetings")),
//   //       body: isLoading
//   //           ? const Center(child: CircularProgressIndicator())
//   //           : upcomingEvents.isEmpty
//   //               ? const Center(child: Text("No upcoming meetings found."))
//   //               : SizedBox(height: 200, child: buildMeetingList()),
//   //     );
//   //   }
//   // }
// }
