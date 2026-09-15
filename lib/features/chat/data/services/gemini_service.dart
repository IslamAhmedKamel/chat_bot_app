import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  late final GenerativeModel model;

  GeminiService({
    required String apiKey,
  }) {
    model = GenerativeModel(
      model: 'gemini-3.6-flash',
      apiKey: apiKey,
    );
  }

  Future<String> sendMessage(String message) async {
    try {
      print('🚀 Calling Gemini API...');

      final response = await model.generateContent(
        [
          Content.text(message),
        ],
      );

      print('📥 Raw Gemini response: $response');

      final text = response.text;

      if (text == null || text.isEmpty) {
        throw Exception('Gemini returned an empty response');
      }

      return text;
    } catch (e) {
      print('🔥 GeminiService Error: $e');
      rethrow;
    }
  }
}