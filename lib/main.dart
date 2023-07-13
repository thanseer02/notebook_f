import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notebook/login.dart';
import 'firebase_options.dart';
import 'home.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Myapp());
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}


class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.black,
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(
          // color: Colors.grey,
          centerTitle: true,
          backgroundColor: Colors.black45,
            foregroundColor: Colors.amber
        )
      ),
    );
  }
}
