import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';

import '../../data/repositories/chat_repository.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;

  ChatCubit({required this.repository}) : super(ChatInitial());
  Future<String?> sendMessage(String message) async {
    if (message.trim().isEmpty) {
      return null;
    }

    emit(ChatLoading());

    try {
      print('📤 Sending message to Gemini...');
      print('📝 Message: $message');

      final response = await repository.sendMessage(message);

      print('✅ Gemini Response: $response');

      emit(ChatSuccess([]));

      return response;
    } catch (e, stackTrace) {
      print('❌ Gemini Error: $e');
      print('📌 StackTrace: $stackTrace');

      emit(ChatFailure(e.toString()));

      return null;
    }
  }
}
