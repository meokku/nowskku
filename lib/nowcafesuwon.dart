import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowCafeSuwon extends StatefulWidget {
  const SKKUNowCafeSuwon({super.key});

  @override
  State<SKKUNowCafeSuwon> createState() => _SKKUNowCafeSuwonState();
}

class _SKKUNowCafeSuwonState extends State<SKKUNowCafeSuwon> {
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
            '실시간 커피점 현황',
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
                            isOpen(8*60+30,19*60,9*60,17*60,9*60,17*60,10*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('카페나무',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-290-5462',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('기숙사의관 1층'),
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
                              Text('평일 08:30 ~ 19:00, 토요일 09:00 ~ 17:00'
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
                                Text('평일 09:00 ~ 17:00 토요일 10:00 ~ 17:00'
                                    '\n주말 및 공휴일 휴무',
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ), //카페나무
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60+30,20*60,8*60+30,17*60,8*60+30,20*60,8*60+30,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('팬도로시',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-292-2006',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('산학협력센터 1층'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('평일 08:30 ~ 20:00, 토요일 08:30 ~ 17:00'
                              '\n일요일 및 공휴일 휴무',
                            style: TextStyle(
                                color: Colors.black45
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //팬도로시
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60,20*60,24*60,24*60,8*60+30,18*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('블루포트',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('010-8554-3130',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('제1공학관23동 2층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 08:00 ~ 20:00 주말 및 공휴일 휴무\n(방학중) 평일 08:30 ~ 18:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //블루포트
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
                              child: Text('로봇커피',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('삼성학술정보관 1층'),
                        ),

                      ],
                    ),
                  ), //로봇커피
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(7*60,21*60,8*60,17*60,7*60,21*60,8*60,17*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('커피빈',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('031-278-7640',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('N센터 1층'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('평일  07:00 ~ 21:00, 토요일 08:00 ~ 17:00'
                                '\n일요일 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            ),
                        ),
                      ],
                    ),
                  ), //커피빈
                ],
              ),
            ],
          ),
        )
    );
  }
}