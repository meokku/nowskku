import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowPCSuwon extends StatefulWidget {
  const SKKUNowPCSuwon({super.key});

  @override
  State<SKKUNowPCSuwon> createState() => _SKKUNowPCSuwonState();
}

class _SKKUNowPCSuwonState extends State<SKKUNowPCSuwon> {
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
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('기초학문관51동 PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-5802',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('기초학문관51동 1층 자연과학대학PC실'),
                        ),
                      ],
                    ),
                  ), //기초학문관51동 PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('제2공학관 4PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-5868',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('제2공학관27동 4층 SSIT 강의실'),
                        ),
                      ],
                    ),
                  ), //제2공학관 4PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('SW실습실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-5868',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('제2공학관27동 4층'),
                        ),
                      ],
                    ),
                  ), //SW실습실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('PACE센터',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-7626',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('제2공학관27동 5층'),
                        ),
                      ],
                    ),
                  ), //PACE센터
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('워크스테이션실1',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-299-4900',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('반도체관 2층 반도체시스템소프트웨어실습실'),
                        ),
                      ],
                    ),
                  ), //워크스테이션실1
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('워크스테이션실2',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-299-4900',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('반도체관 2층 다목적실험실습실'),
                        ),
                      ],
                    ),
                  ), //워크스테이션실2
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('워크스테이션실3',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-299-4900',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('반도체관 2층 반도체학술정보관'),
                        ),
                      ],
                    ),
                  ), //워크스테이션실3
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('생명공학관 62동 PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('010-6416-0208',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), //생명공학관 62동 PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('의학관 컴퓨터 실습실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-299-6026	',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), //의학관 컴퓨터 실습실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            open,
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('ADIC센터',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-5881	',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('제1공학관22동 3층 ADIC센터'),
                        ),
                      ],
                    ),
                  ), //ADIC센터

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,17*60+30,24*60,24*60,9*60,17*60+30,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('수성관 PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-299-6920',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일 09:00 ~ 17:30 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //수성관 PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,17*60,24*60,24*60,9*60,17*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('제1공학관22동 PC실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-5881',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('제1공학관22동 3층 기계공학부PC실'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일 09:00 ~ 17:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //제1공학관22동 PC실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,20*60,24*60,24*60,9*60,20*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('정보검색실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('010-4858-7751',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('제1공학관22동 2층 정보검색실'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일 09:00 ~ 20:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //정보검색실

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60,17*60+30,10*60,17*60,9*60,17*60+30,10*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('컴넷',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-4021',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('삼성학술정보관 1층 컴넷'),
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
                                Text('평일 08:00 ~ 17:30, 토요일 10:00 ~ 17:00'
                                    '\n일요일 및 공휴일 휴무',
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),
                                ),
                              ],
                            )
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
                            )
                        ),
                      ],
                    ),
                  ), //컴넷
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,17*60+30,10*60,17*60,9*60,17*60+30,10*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('멀티미디어실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-4021',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('삼성학술정보관 2층 Multimedia Area'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일 09:00 ~ 17:30, 토요일 10:00 ~ 17:00'
                                '\n일요일 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //멀티미디어실
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,21*60+30,10*60,17*60,9*60,17*60+30,10*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('일반자료실',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-4021',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('삼성학술정보관 3층 자료실-1'),
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
                                Text('평일 09:00 ~ 21:30, 토요일 10:00 ~ 17:00'
                                    '\n일요일 및 공휴일 휴무',
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),
                                ),
                              ],
                            )
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
                            )
                        ),
                      ],
                    ),
                  ), //일반자료실

                ],
              ),
            ],
          ),
        )
    );
  }
}