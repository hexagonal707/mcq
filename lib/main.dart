import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcq/data/quiz_data.dart';
import 'package:mcq/screens/home/home_page.dart';
import 'package:mcq/screens/welcome/welcome_page.dart';
import 'package:provider/provider.dart';

import 'data/user_data.dart';
import 'firebase_options.dart';

void main() async {
  //FireBase Initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserData()),
        ChangeNotifierProvider(create: (context) => QuizData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Inter',
            brightness: Brightness.light,
            colorSchemeSeed: Colors.blue,
            useMaterial3: true),
        darkTheme: ThemeData(
            fontFamily: 'Inter',
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.blue,
            useMaterial3: true),
        //(routes.dart)
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const WelcomePage();
            }
          },
        ),
      ),
    );
  }
}
