import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/chat_message_model.dart';

class ChatLocalStorage {
  static late SharedPreferences sharedPreferences;

  //! Here The Initialize of cache .
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String messagesKey = 'chat_messages';

  Future<void> saveMessages(List<ChatMessageModel> messages) async {
    final messagesJson = messages.map((message) => message.toJson()).toList();

    await sharedPreferences.setString(messagesKey, jsonEncode(messagesJson));
  }

  Future<List<ChatMessageModel>> getMessages() async {
    final data = sharedPreferences.getString(messagesKey);

    if (data == null || data.isEmpty) {
      return [];
    }

    final List<dynamic> decoded = jsonDecode(data);

    return decoded
        .map(
          (message) =>
              ChatMessageModel.fromJson(Map<String, dynamic>.from(message)),
        )
        .toList();
  }

  Future<void> clearMessages() async {
    await sharedPreferences.remove(messagesKey);
  }
}
