import 'package:cipher_box/screens/home.dart';
import 'package:cipher_box/screens/confirmmaster.dart';
import 'package:cipher_box/screens/createmaster.dart';
import 'package:cipher_box/screens/deletemaster.dart';
import 'package:cipher_box/screens/editmaster.dart';
import 'package:cipher_box/screens/intro.dart';
import 'package:cipher_box/screens/master.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Box masterBox = await Hive.openBox('master');
  Box dataBox = await Hive.openBox('data');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final masterBox = Hive.box('master');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cipher Box",
      initialRoute: (masterBox.get('created') != null) ? '/' : '/intro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/': (context) => const MasterPage(),
        '/intro': (context) => const Intro(),
        '/home': (context) => const Home(),
        '/createmaster': (context) => const CreateMaster(),
        '/editmaster': (context) => const EditMaster(),
        '/confirmmaster': (context) => const ConfirmMaster(),
        '/deletemaster': (context) => const DeleteMaster(),
      },
    );
  }
}
