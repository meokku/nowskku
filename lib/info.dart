import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 102, 83, 1),
      appBar: AppBar(
          toolbarHeight: 80,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 90,
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black26,
                  width: 1,
                )
            ),
            child: TextButton(
              onPressed: ()
              async {
                final url = Uri.parse('https://forms.gle/EnwL8AGonm3whcBz9');
                launchUrl(url, mode: LaunchMode.externalApplication);
              },
              child: Text(
              '건의 사항',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
                border: Border.all(
                  color: Colors.black26,
                  width: 1,
                )
            ),
            child: TextButton(
              onPressed: ()
              async {
                final url = Uri.parse('https://forms.gle/qFVXaVXprEB2fdZX9');
                launchUrl(url, mode: LaunchMode.externalApplication);
              },
              child: Text(
                '개발자와 컨택하기',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}