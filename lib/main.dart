import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

void main() async {
    runApp(const MyApp());
}

class NowBus {
  String? sequcence;
  String? carnumber;
  String? kind;
}

Future<NowBus> bus() async {
  String url = "https://www.skku.edu/skku/popup/shuttlebus_popup.do?srKey=2009";
  var response = await http.get(Uri.parse(url));
  var nowBus = NowBus();
  if (response.statusCode == 200) {
    var document = parse(response.body);
    print(document.head);
    String active = "li[class='active']";

    nowBus.sequcence = document.body
        ?.querySelector(active)
        ?.attributes['data-sequcence']; // 버스 현 위치
    nowBus.carnumber = document.body
        ?.querySelector(active)
        ?.attributes['data-carnumber']; // 버스 번호
    nowBus.kind = document.body
        ?.querySelector(active)
        ?.attributes['data-kind'];
  } else {
    nowBus.sequcence = null;
    nowBus.carnumber = null;
    nowBus.kind = null;
  }
  return nowBus;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<NowBus> now_Bus = bus();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder(
            future: now_Bus,
            builder: (context,snapshot) {
              if (snapshot.hasData){
                String? carnum = snapshot.data?.carnumber;
                if (carnum!=null){
                  return Text(
                      carnum!
                  );
                }
              }
              return Text(
                  "No Bus"
              );
            },
          )
        ),
      ),
    );
  }
}