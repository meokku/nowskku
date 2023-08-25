import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowDoctor extends StatefulWidget {
  const SKKUNowDoctor({super.key});

  @override
  State<SKKUNowDoctor> createState() => _SKKUNowDoctorState();
}

class _SKKUNowDoctorState extends State<SKKUNowDoctor> {
  final ScrollController _scrollController = ScrollController();
  var open = Padding(
    padding: const EdgeInsets.fromLTRB(20,0,10,0),
    child: Container(
      width: 15,
      height: 15,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green
      ),
    ),
  );
  var close = Padding(
    padding: const EdgeInsets.fromLTRB(20,0,10,0),
    child: Container(
      width: 15,
      height: 15,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red
      ),
    ),
  );

  Widget isOpen(MonOpen,MonClose,TueOpen,TueClose,WedOpen,WedClose,ThuOpen,ThuClose,FriOpen,FriClose) {
    return TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          var localtime = DateTime
              .now()
              .toLocal();
          var day = DateFormat('E').format(localtime);
          var hour = localtime.hour;
          var min = localtime.minute;
          var time = hour*60+min;
          var openTime=0;
          var closeTime=0;
          if ((day=='Sun') || (day=='Sat')||(_isDayOff)) return close;
          else if (day=='Mon'){
            openTime = MonOpen;
            closeTime = MonClose;
          } else if (day=='Tue'){
            openTime=TueOpen;
            closeTime=TueClose;
          } else if (day=='Wed'){
            openTime=WedOpen;
            closeTime=WedClose;
          } else if (day=='Thu') {
            openTime=ThuOpen;
            closeTime=ThuClose;
          } else if (day=='Fri'){
            openTime=FriOpen;
            closeTime=FriClose;
          }
          if (time>=openTime && time<closeTime){
            return open;
          }
          return close;
        }
    );
  }
  bool _isDayOff = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '실시간 건강센터 현황',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20
            ),
          ),
        ),
        body: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          thickness: 10,
          child: ListView(
            controller: _scrollController,
            children: [
              Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  open,
                                  Text('open'),
                                  close,
                                  Text('close'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:10,right: 30),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _isDayOff,
                                  activeColor: const Color.fromRGBO(43, 102, 83, 1),
                                  onChanged: (value) {
                                    setState(() {
                                      _isDayOff = value!;
                                    });
                                  },
                                ),
                                Text("공휴일")
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(24*60,24*60,14*60,17*60,24*60,24*60,14*60,17*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('내과',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('월: 휴진'
                              '\n화: 14:00 ~ 17:00'
                              '\n수: 휴진'
                              '\n목: 14:00 ~ 17:00'
                              '\n금: 휴진',
                            style: TextStyle(
                                color: Colors.black45
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //내과
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(13*60,16*60+30,9*60+30,15*60,24*60,24*60,9*60+30,15*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('치과',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('월: 13:00 ~ 16:30'
                              '\n화: 09:30 ~ 15:00'
                              '\n수: 휴진'
                              '\n목: 09:30 ~ 15:00'
                              '\n금: 휴진',
                            style: TextStyle(
                                color: Colors.black45
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //치과
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(13*60,16*60,24*60,24*60,13*60,16*60,24*60,24*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('정신건강의학과',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('월: 13:00 ~ 16:00'
                              '\n화: 휴진'
                              '\n수: 13:00 ~ 16:00'
                              '\n목: 휴진'
                              '\n금: 휴진',
                            style: TextStyle(
                                color: Colors.black45
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //정신건강의학과
                ],
              )
            ],
          ),
        )
    );
  }
}