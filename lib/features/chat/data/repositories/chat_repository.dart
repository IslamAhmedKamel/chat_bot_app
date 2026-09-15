import '../services/gemini_service.dart';

class ChatRepository {
  final GeminiService geminiService;

  ChatRepository({
    required this.geminiService,
  });

  Future<String> sendMessage(String message) async {
    return await geminiService.sendMessage(message);
  }
}