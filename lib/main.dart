import 'package:chatbot_app/core/utils/constant_app.dart';
import 'package:chatbot_app/features/chat/data/repositories/chat_repository.dart';
import 'package:chatbot_app/features/chat/data/services/chat_local_storage.dart';
import 'package:chatbot_app/features/chat/data/services/gemini_service.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chatbot_app/features/chat/presentation/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/observe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ChatLocalStorage.init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ChatCubit(
          repository: ChatRepository(
            geminiService: GeminiService(apiKey: AppConstant.apiKey),
          ),
        ),
        child: const ChatView(),
      ),
    );
  }
}
