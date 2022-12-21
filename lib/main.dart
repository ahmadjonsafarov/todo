import 'package:flutter/material.dart';
import 'package:todo_app/page/homepage.dart';
import 'package:todo_app/page/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff62CD5D),
          titleTextStyle: Style.TextStyleBold(),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
