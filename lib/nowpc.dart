import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowPC extends StatefulWidget {
  const SKKUNowPC({super.key});

  @override
  State<SKKUNowPC> createState() => _SKKUNowPCState();
}

class _SKKUNowPCState extends State<SKKUNowPC> {
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

  Widget isOpen(OpenTime,CloseTime,SatOpenTime,SatCloseTime,VacOpenTime,VacCloseTime,VacSatOpen,VacSatClose) {
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
          var openTime = OpenTime;
          var closeTime = CloseTime;
          if ((day=='Sun')||(_isDayOff)) return close;
          if (_isChecked) {
            openTime = VacOpenTime;
            closeTime = VacCloseTime;
            if (day=='Sat') {
              openTime = VacSatOpen;
              closeTime = VacSatClose;
            }
          }
          else if (day=='Sat'){
            openTime = SatOpenTime;
            closeTime = SatCloseTime;
          }
          if (time>=openTime && time<closeTime){
            return open;
          }
          return close;
        }
    );
  }
  bool _isChecked = false;
  bool _isDayOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '실시간 PC실 현황',
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
                            padding: const EdgeInsets.only(right:30,top: 20),
                            child: Row(
                              children: [
                                Text('학기중'),
                                SizedBox(
                                  height: 30,
                                  child: Switch(
                                      activeColor: const Color.fromRGBO(7, 42, 92, 1),
                                      value: _isChecked,
                                      onChanged: (value){
                                        setState(() {
                                          _isChecked = value;
                                        });
                                      }),
                                ),
                                Text('방학중')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
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
                            isOpen(9*60,21*60,24*60,24*60,9*60,15*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('경영관 2PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-0941',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 09:00 ~ 21:00 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 09:00 ~ 15:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //경영관 2PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60,24*60,24*60,9*60,15*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('경영관 1PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-0941',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 2층 제1PC실'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 09:00 ~ 21:00 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 09:00 ~ 15:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //경영관 1PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60+30,9*60,17*60,9*60,17*60+30,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('경제관 6PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1258',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('다산경제관'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 21:30, 토요일 09:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(방학중) 평일 09:00 ~ 17:30 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //경제관 6PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60+30,9*60,17*60,9*60,17*60+30,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('경제관 5PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1258',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('다산경제관 5층'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 21:30, 토요일 09:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(방학중) 평일 09:00 ~ 17:30 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //경제관 5PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60+30,9*60,17*60,9*60,17*60+30,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('Creative Smart Zone',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1258',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('다산경제관 4층 학생연구라운지'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 21:30, 토요일 09:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(방학중) 평일 09:00 ~ 17:30 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //Creative Smart Zone
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60+30,9*60,17*60,9*60,17*60+30,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('경제관 2PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1258',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('다산경제관 4층 정보통신팀 제2PC실(수업용)[~23.2학기]'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 21:30, 토요일 09:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(방학중) 평일 09:00 ~ 17:30 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //경제관 2PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60+30,9*60,17*60,9*60,17*60+30,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('경제관 1PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1258',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('다산경제관 4층 정보통신팀 제1PC실(수업용)[~23.2학기]'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 21:30, 토요일 09:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(방학중) 평일 09:00 ~ 17:30 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //경제관 1PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60+30,24*60,24*60,9*60,21*60+30,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('첨단강의실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-0945',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('퇴계인문관 4층 경제대학첨단강의실'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일 09:00 ~ 21:30 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //첨단강의실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60,24*60,24*60,9*60,17*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('법학관 1PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-0924',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('법학관 지하1층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 09:00 ~ 21:00 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 09:00 ~ 17:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //법학관 1PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60,21*60+30,10*60,17*60,9*60,17*60+30,10*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('킹고까페_1',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1158',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('중앙학술정보관 3층'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 08:00 ~ 21:30, 토요일 10:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(방학중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 17:30, 토요일 10:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), //킹고까페_1
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60,21*60+30,10*60,17*60,9*60,17*60+30,10*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('킹고까페_2',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1158',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('중앙학술정보관 3층'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 08:00 ~ 21:30, 토요일 10:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(방학중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 17:30, 토요일 10:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), //킹고까페_2
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60,21*60+30,10*60,17*60,9*60,17*60+30,10*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('킹고존',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1158',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('중앙학술정보관 3층 킹고존(우석정호홀)'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 08:00 ~ 21:30, 토요일 10:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(방학중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 17:30, 토요일 10:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), //킹고존
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60,21*60+30,10*60,17*60,9*60,17*60+30,10*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('킹고넷터',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-760-1158',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('중앙학술정보관 3층 러닝 커먼스'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(학기중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 08:00 ~ 21:30, 토요일 10:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('(방학중) ',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                              Text('평일 09:00 ~ 17:30, 토요일 10:00 ~ 17:00'
                                  '\n일요일 및 공휴일 휴무',
                                style: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), //킹고넷터
                ],
              ),
            ],
          ),
        )
    );
  }
}