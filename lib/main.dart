import 'package:chat_app/chatRoom.dart';
import 'package:chat_app/database.dart';
import 'package:chat_app/signIn.dart';
import 'package:chat_app/signUp.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences sp = await SharedPreferences.getInstance();
  bool isLoggedIn =
      sp.getBool("ISLOGGEDIN") == null ? false : sp.getBool("ISLOGGEDIN");
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://74eac252a5c94f68a0d6c66188fa7c66@o582534.ingest.sentry.io/5736589';
    },
    appRunner: () => runApp(MyApp(
      isLoggedIn: isLoggedIn,
    )),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class MyApp extends StatelessWidget {
  bool isLoggedIn;
  MyApp({this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat Snap',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLoggedIn ? ChatRoom() : SignIn());
  }
}
