import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../../data/models/chat_message_model.dart';
import '../../data/services/chat_local_storage.dart';
import '../cubit/chat_cubit.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final InMemoryChatController chatController = InMemoryChatController();

  final ChatLocalStorage localStorage = ChatLocalStorage();

  final String userId = 'user';
  final String aiId = 'gemini';

  @override
  void initState() {
    super.initState();

    loadOldMessages();
  }

  // تحميل الرسائل القديمة
  Future<void> loadOldMessages() async {
    final messages = await localStorage.getMessages();

    for (final message in messages) {
      await chatController.insertMessage(
        TextMessage(
          id: message.id,
          authorId: message.authorId,
          createdAt: message.createdAt,
          text: message.text,
        ),
      );
    }
  }

  // حفظ رسالة
  Future<void> saveMessage({
    required String id,
    required String authorId,
    required String text,
    required DateTime createdAt,
  }) async {
    final oldMessages = await localStorage.getMessages();

    oldMessages.add(
      ChatMessageModel(
        id: id,
        authorId: authorId,
        text: text,
        createdAt: createdAt,
      ),
    );

    await localStorage.saveMessages(oldMessages);
  }

  // إرسال الرسالة
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMessageId = Random().nextInt(999999).toString();

    final userMessageTime = DateTime.now().toUtc();

    // عرض رسالة المستخدم
    await chatController.insertMessage(
      TextMessage(
        id: userMessageId,
        authorId: userId,
        createdAt: userMessageTime,
        text: text,
      ),
    );

    // حفظ رسالة المستخدم
    await saveMessage(
      id: userMessageId,
      authorId: userId,
      text: text,
      createdAt: userMessageTime,
    );

    // إرسال الرسالة إلى Gemini
    final response = await context.read<ChatCubit>().sendMessage(text);

    if (response == null || response.isEmpty) {
      return;
    }

    final aiMessageId = Random().nextInt(999999).toString();

    final aiMessageTime = DateTime.now().toUtc();

    // عرض رد Gemini
    await chatController.insertMessage(
      TextMessage(
        id: aiMessageId,
        authorId: aiId,
        createdAt: aiMessageTime,
        text: response,
      ),
    );

    // حفظ رد Gemini
    await saveMessage(
      id: aiMessageId,
      authorId: aiId,
      text: response,
      createdAt: aiMessageTime,
    );
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gemini AI 🤖'), centerTitle: true),

      body: Chat(
        chatController: chatController,
        currentUserId: userId,
        onMessageSend: sendMessage,

        resolveUser: (id) async {
          if (id == userId) {
            return const User(id: 'user', name: 'Islam');
          }

          return const User(id: 'gemini', name: 'Gemini');
        },
      ),
    );
  }
}
