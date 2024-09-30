import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/networking/DB.dart';
import 'package:todo/screens/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBRepo.initializeDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
