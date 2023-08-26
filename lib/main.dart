/*import 'package:flutter/material.dart';
import 'package:smartfarm/screens/dashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smartfarm/screens/sample.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.dark,
      ),
      /*routes: <String, WidgetBuilder>{
        '/dashscreen': (BuildContext context) => const DashScreen()
      },*/
      home: const DashScreen(),
    );
  }
}*/

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/screens/gettingstarted.dart';
//import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const GetStart(),
    );
  }
}
