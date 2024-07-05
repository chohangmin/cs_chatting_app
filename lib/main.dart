import 'package:flutter/material.dart';
import 'package:cs_chat_app/screens/login_signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDlMupymREOBMQvfXyohfNNa3LQfp_jM6c',
    appId: '1:461128268139:android:518a7da1a4437aac3c742e',
    messagingSenderId: '461128268139',
    projectId: 'my-project-5ad95',
    storageBucket: 'my-project-5ad95.appspot.com',
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginSignupScreen(),
    );
  }
}
