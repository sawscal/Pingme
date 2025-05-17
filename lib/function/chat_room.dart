class ChatRoom {
  final String id;
  final String name;
  final bool isPrivate;
  final bool requireBlockchainId;
  final DateTime createdAt;
  final int colorHex;

  ChatRoom({
    required this.id,
    required this.name,
    required this.isPrivate,
    required this.requireBlockchainId,
    required this.createdAt,
    required this.colorHex,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'isPrivate': isPrivate,
    'requireBlockchainId': requireBlockchainId,
    'createdAt': createdAt.toIso8601String(),
    'colorHex': colorHex,
  };
}
