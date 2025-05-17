// // dart format width=80
// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouterGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// part of 'app_router.dart';

// /// generated route for
// /// [CreateRoomPage]
// class CreateRoomRoute extends PageRouteInfo<void> {
//   const CreateRoomRoute({List<PageRouteInfo>? children})
//     : super(CreateRoomRoute.name, initialChildren: children);

//   static const String name = 'CreateRoomRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return CreateRoomPage();
//     },
//   );
// }

// /// generated route for
// /// [HomeScreen]
// class HomeRoute extends PageRouteInfo<void> {
//   const HomeRoute({List<PageRouteInfo>? children})
//     : super(HomeRoute.name, initialChildren: children);

//   static const String name = 'HomeRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const HomeScreen();
//     },
//   );
// }

// /// generated route for
// /// [RoomPrivacyPage]
// class RoomPrivacyRoute extends PageRouteInfo<RoomPrivacyRouteArgs> {
//   RoomPrivacyRoute({
//     Key? key,
//     required String roomName,
//     List<PageRouteInfo>? children,
//   }) : super(
//          RoomPrivacyRoute.name,
//          args: RoomPrivacyRouteArgs(key: key, roomName: roomName),
//          initialChildren: children,
//        );

//   static const String name = 'RoomPrivacyRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       final args = data.argsAs<RoomPrivacyRouteArgs>();
//       return RoomPrivacyPage(key: args.key, roomName: args.roomName);
//     },
//   );
// }

// class RoomPrivacyRouteArgs {
//   const RoomPrivacyRouteArgs({this.key, required this.roomName});

//   final Key? key;

//   final String roomName;

//   @override
//   String toString() {
//     return 'RoomPrivacyRouteArgs{key: $key, roomName: $roomName}';
//   }
// }

// /// generated route for
// /// [RoomThemePage]
// class RoomThemeRoute extends PageRouteInfo<RoomThemeRouteArgs> {
//   RoomThemeRoute({
//     Key? key,
//     required String roomName,
//     required bool isPrivate,
//     required bool requireBlockchainId,
//     List<PageRouteInfo>? children,
//   }) : super(
//          RoomThemeRoute.name,
//          args: RoomThemeRouteArgs(
//            key: key,
//            roomName: roomName,
//            isPrivate: isPrivate,
//            requireBlockchainId: requireBlockchainId,
//          ),
//          initialChildren: children,
//        );

//   static const String name = 'RoomThemeRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       final args = data.argsAs<RoomThemeRouteArgs>();
//       return RoomThemePage(
//         key: args.key,
//         roomName: args.roomName,
//         isPrivate: args.isPrivate,
//         requireBlockchainId: args.requireBlockchainId,
//       );
//     },
//   );
// }

// class RoomThemeRouteArgs {
//   const RoomThemeRouteArgs({
//     this.key,
//     required this.roomName,
//     required this.isPrivate,
//     required this.requireBlockchainId,
//   });

//   final Key? key;

//   final String roomName;

//   final bool isPrivate;

//   final bool requireBlockchainId;

//   @override
//   String toString() {
//     return 'RoomThemeRouteArgs{key: $key, roomName: $roomName, isPrivate: $isPrivate, requireBlockchainId: $requireBlockchainId}';
//   }
// }
