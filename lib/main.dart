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
  static _MyAppState? of(BuildContext context){
    context.findAncestorStateOfType<_MyAppState>();
  }
}

class _MyAppState extends State<MyApp> {
  bool isChange=false;
  void change(){
    isChange=!isChange;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Color(0xff62CD5D),
      //     titleTextStyle: Style.TextStyleBold(),
      //   )
      // ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
