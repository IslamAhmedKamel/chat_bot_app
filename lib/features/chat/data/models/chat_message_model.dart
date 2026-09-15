class ChatMessageModel {
  final String id;
  final String authorId;
  final String text;
  final DateTime createdAt;

  ChatMessageModel({
    required this.id,
    required this.authorId,
    required this.text,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorId': authorId,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      authorId: json['authorId'],
      text: json['text'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}