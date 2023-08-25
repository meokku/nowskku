import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:nowskku/main.dart';

class NowBus {
  var nowBusList={};
}

Future<NowBus> bus() async {
  String url = "https://www.skku.edu/skku/popup/shuttlebus_popup.do?srKey=2009";
  var response = await http.get(Uri.parse(url));
  var nowBus = NowBus();
  if (response.statusCode == 200) {
    var document = parse(response.body);
    String active = "li[class='active']";
    var busList = document.body
        ?.querySelectorAll(active);
    for (int i=0;i<busList!.length;i++){
      nowBus.nowBusList[i]=
      { 'sequence':busList[i].attributes['data-sequcence'],
        'carnumber':busList[i].attributes['data-carnumber'],
        'eventdate':busList[i].attributes['data-eventdate'],
        'usetime':busList[i].attributes['data-usetime']};
    }
  }
  return nowBus;
}

class SKKUNowBus extends StatefulWidget {
  const SKKUNowBus({super.key});

  @override
  State<SKKUNowBus> createState() => _SKKUNowBusState();
}

class _SKKUNowBusState extends State<SKKUNowBus> {
  Future<void> requestNew() async{
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      nowBus=bus();
    });
  }
  Widget isNowBus(num, nowBus){
    return FutureBuilder(
        future: bus(),
        builder: (context,snapshot) {
          var index=-1;
          if (snapshot.hasData){
            for (int i=0;i<snapshot.data!.nowBusList.length;i++){
              if (snapshot.data!.nowBusList[i]['sequence']==num.toString()){
                index=i;
                continue;
              }
            }
            if (index>-1) {
              if (snapshot.data!.nowBusList[index]['usetime']=="0"){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(19,20,0,30),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: 90,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: SKKUgreen,
                                  width: 2
                              )
                          ),
                          child: Column(
                            children: [
                              Text(snapshot.data!.nowBusList[index]['carnumber'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        height: 20,
                        child: const Icon(
                          Icons.directions_bus_rounded,
                          color: const Color.fromRGBO(141, 198, 63, 1),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(116,20,0,20),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: const Color.fromRGBO(255, 108, 15, 1),
                            size: 30,
                          )
                      ),
                    ),
                    Positioned(
                        top: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2,right: 3),
                                child: Container(
                                  width: 90,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: SKKUgreen,
                                      width: 3,
                                    )
                                  ),
                                  child: Column(
                                    children: [
                                      Text(snapshot.data!.nowBusList[index]['carnumber'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,

                                      ),
                                      ),
                                      Text(snapshot.data!.nowBusList[index]['usetime']+"분 전 출발",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: Colors.white,
                                ),
                                height: 20,
                                child: const Icon(
                                  Icons.directions_bus_rounded,
                                  color: Color.fromRGBO(141, 198, 63, 1),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                );
              }
            }
          } return Padding(
            padding: EdgeInsets.fromLTRB(116,20,0,20),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
              ),
              child: Icon(
                Icons.arrow_drop_down_circle,
                color: const Color.fromRGBO(255, 108, 15, 1),
                size: 30,
              ),
            ),
          );
        }
    );
  }

  @override
  Future<NowBus> nowBus=bus();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '실시간 버스 현황',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => requestNew(),
          child: Stack(
              children: [
                ListView(),
                SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 130),
                              child: Container(
                                color: const Color.fromRGBO(255, 108, 15, 1),
                                height: 700,
                                width: 3,
                              ),
                            ),
                            Column(
                              children: [
                                isNowBus(1,nowBus),
                                isNowBus(2,nowBus),
                                isNowBus(3,nowBus),
                                isNowBus(4,nowBus),
                                isNowBus(5,nowBus),
                                isNowBus(6,nowBus),
                                isNowBus(7,nowBus),
                                isNowBus(8,nowBus),
                                isNowBus(9,nowBus),
                                isNowBus(10,nowBus),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "정차소(인문.농구장)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "학생회관(인문)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "정문(인문-하교)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "혜화로터리(하차지점)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "혜화역U턴지점",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "혜화역(승차장)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "혜화로터리(경유)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "맥도날드 건너편",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "정문(인문-등교)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Container(
                              child: Text(
                                "600주년 기념관",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]
          ),
        ),
      );
  }
}