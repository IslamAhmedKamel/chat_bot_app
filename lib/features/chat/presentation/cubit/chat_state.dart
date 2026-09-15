import 'package:flutter_chat_core/flutter_chat_core.dart';

abstract class ChatState {
  const ChatState();
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final List<Message> messages;

  const ChatSuccess(this.messages);
}

class ChatFailure extends ChatState {
  final String message;

  const ChatFailure(this.message);
}