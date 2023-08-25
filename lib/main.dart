import 'package:flutter/material.dart';
import 'app.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'now SKKU',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14
            ),
            foregroundColor: SKKUBlue,
              backgroundColor: Colors.transparent,
              shadowColor: Color.fromRGBO(255, 255, 255, 500)
          )
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: SKKUbackground(),
        ),
          fontFamily: "Elice",
      ),
      home: App(),
    );
  }
}

Color SKKUgreen = const Color.fromRGBO(141, 198, 63, 1);
Color SKKUgreen2 = const Color.fromRGBO(43, 102, 83, 1);
Color SKKUBlue = const Color.fromRGBO(7, 42, 92, 1);
Color SKKUOrange = const Color.fromRGBO(255, 108, 15, 1);
bool _isFirst=true;

Color SKKUbackground(){
  if (_isFirst) return SKKUgreen2;
  return SKKUgreen;
}

