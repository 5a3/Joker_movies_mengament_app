import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:joker/joker/allmove.dart';
import 'package:joker/joker/allseries.dart';
import 'package:joker/joker/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'admin/Categories.dart';
import 'firebase_options.dart';

// import '../notes/viewnote.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent),
            textTheme:
                TextTheme(bodyLarge: TextStyle(fontWeight: FontWeight.bold)),
            appBarTheme: AppBarTheme(
                titleTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                centerTitle: true,
                backgroundColor: Colors.blueAccent)),
        debugShowCheckedModeBanner: false,
        routes: {
          AllMoveies.id: (context) => AllMoveies(),
          allseries.id: (context) => allseries(),

          // SignUp.id: (context) => SignUp(),
        },
        home: home());
  }
}
