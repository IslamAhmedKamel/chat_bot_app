# 🤖 Chatbot App

A modern AI-powered chatbot application built with **Flutter**. The app provides a conversational interface that allows users to send messages, receive AI-generated responses, and keep their conversation history available locally.

## ✨ Features

- 💬 Interactive chat interface
- 🤖 AI-generated responses using **Google Gemini**
- 🗂️ Conversation history stored locally
- 🔄 State management with **BLoC/Cubit**
- 🗄️ PocketBase integration for backend-related functionality
- 📱 Responsive Flutter UI for mobile devices
- ⚡ Clean and scalable project structure

> **Note:** Features may vary depending on the current implementation and configuration of the project.

## 🛠️ Tech Stack

- **Flutter**
- **Dart**
- **flutter_bloc** – State management
- **flutter_chat_ui** – Chat interface
- **google_generative_ai** – Google Gemini integration
- **PocketBase** – Backend and database integration
- **shared_preferences** – Local data persistence

## 📂 Project Structure

The project follows a feature-oriented Flutter structure to keep the code organized and maintainable.

```text
lib/
├── core/
│   ├── network/
│   ├── utils/
│   └── ...
├── features/
│   └── chatbot/
│       ├── data/
│       ├── logic/
│       └── presentation/
└── main.dart
```

> The structure above is a general overview. Folder names may differ slightly from the current project implementation.

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/IslamAhmedKamel/chat_bot_app.git
```

### 2. Move into the project directory

```bash
cd chat_bot_app
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Configure your API key

The application uses Google Gemini through the `google_generative_ai` package.

Before running the app, configure your Gemini API key using a secure method suitable for your environment. **Do not commit real API keys, passwords, or secrets to GitHub.**

If your project uses a constants file or environment configuration, make sure the real key is excluded from Git tracking and provide a safe example configuration for other developers.

### 5. Run the application

```bash
flutter run
```

## 🔐 Security Notes

- Never upload your Gemini API key to a public repository.
- Add files containing secrets to `.gitignore`.
- If an API key was previously committed, revoke or rotate it through the relevant provider dashboard.
- Use environment variables or a secure backend proxy for production applications.

## 📸 Screenshots

Add screenshots or a short screen recording of the application here to showcase the chat interface and the main user flow.

```text
Coming soon...
```

## 🔮 Future Improvements

- User authentication
- Cloud-based conversation synchronization
- Multiple chat sessions
- Message streaming
- Better error handling and retry support
- Dark mode
- Voice input and text-to-speech

## 👨‍💻 Author

**Islam Ahmed Kamel**

Flutter Developer | Mobile App Developer

- GitHub: [IslamAhmedKamel](https://github.com/IslamAhmedKamel)

## ⭐ Support

If you find this project useful, consider giving it a ⭐ on GitHub.

## 📄 License

This project is for learning and development purposes. Add a specific license if you plan to distribute or reuse the project publicly.
