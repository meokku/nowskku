import 'package:flutter/material.dart';
import 'package:nowskku/home.dart';
import 'package:nowskku/info.dart';

Color SKKUgreen = const Color.fromRGBO(141, 198, 63, 1);
Color SKKUgreen2 = const Color.fromRGBO(43, 102, 83, 1);
Color SKKUBlue = const Color.fromRGBO(7, 42, 92, 1);
Color SKKUOrange = const Color.fromRGBO(255, 108, 15, 1);

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    MyHomePage(),
    InfoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_rounded),
                label: 'Info'
            ),
          ],
          iconSize: 30,
          currentIndex: _selectedIndex,
          selectedItemColor: SKKUgreen2, // 선택된 요소 색
          unselectedItemColor: Colors.grey, // 선택되지 않은 요소 색
          selectedLabelStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: SKKUgreen2
          ), // 선택된 라벨 스타일
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ), // 선택되지 않은 라벨 스타일
        ),
      ),
    );
  }
}