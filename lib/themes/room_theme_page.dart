// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:ping_me/function/roommodel.dart';
// import 'package:uuid/uuid.dart';

// @RoutePage() 
// class RoomThemePage extends HookWidget {
//   final String roomName;
//   final bool isPrivate;
//   final bool requireBlockchainId;

//   const RoomThemePage({
//     super.key,
//     required this.roomName,
//     required this.isPrivate,
//     required this.requireBlockchainId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final selectedColor = useState<Color>(Colors.blue);

//     return Scaffold(
//       appBar: AppBar(title: const Text("Pick Room Theme")),
//       body: Column(
//         children: [
//           Wrap(
//             spacing: 12,
//             children: [
//               Colors.blue,
//               Colors.green,
//               Colors.red,
//               Colors.purple,
//               Colors.orange,
//             ].map((color) {
//               return GestureDetector(
//                 onTap: () => selectedColor.value = color,
//                 child: CircleAvatar(
//                   backgroundColor: color,
//                   radius: 30,
//                   child: selectedColor.value == color
//                       ? const Icon(Icons.check, color: Colors.white)
//                       : null,
//                 ),
//               );
//             }).toList(),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               final newRoom = ChatRoom(
//                 id: const Uuid().v4(),
//                 name: roomName,
//                 isPrivate: true,
//                 requireBlockchainId: true,
//                 createdAt: DateTime.now(),
//                 colorHex: selectedColor.value.value,
//               );

//               // TODO: Call Rust backend or save to Firebase/IPFS
//               print("Room Created: $newRoom");

//               context.router.popUntilRoot(); // Or navigate to chat screen
//             },
//             child: const Text("Create Room"),
//           )
//         ],
//       ),
//     );
//   }
// }
