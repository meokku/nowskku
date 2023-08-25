import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowShop extends StatefulWidget {
  const SKKUNowShop({super.key});

  @override
  State<SKKUNowShop> createState() => _SKKUNowShopState();
}

class _SKKUNowShopState extends State<SKKUNowShop> {
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
            '실시간 복지 매장 현황',
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
                        child: Padding(
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
                            isOpen(9*60,18*60,24*60,24*60,9*60,15*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('서점',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1908',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하3층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 09:00 ~ 18:00 주말 및 공휴일 휴무\n(방학중) 평일 09:00 ~ 15:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //서점
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60,18*60,24*60,24*60,9*60,17*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('문구점',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1911',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하3층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 08:00 ~ 18:00 주말 및 공휴일 휴무\n(방학중) 평일 09:00 ~ 17:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //문구점
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(10*60+30,17*60,24*60,24*60,10*60+30,15*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('안경점',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1911',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하3층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 10:30 ~ 17:00 주말 및 공휴일 휴무\n(방학중) 평일 10:30 ~ 15:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //안경점
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(10*60,19*60,10*60,19*60,10*60,19*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('박준뷰티랩(미용실)',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1919',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하3층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일, 토요일 10:00 ~ 19:00\n일요일 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //박준뷰티랩(미용실)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60+30,18*60,24*60,24*60,10*60+30,17*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('화원',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1913',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하3층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 09:30 ~ 18:00 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 10:30 ~ 17:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //화원
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
                              child: Text('구두수선점',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1918',
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
                            child: Text('예약제로 운영',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //구두수선점
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(10*60,18*60,24*60,24*60,10*60,17*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('기념품매장',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1907',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하3층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 10:00 ~ 18:00 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 10:00 ~ 17:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //기념품매장
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,18*60+30,24*60,24*60,10*60,18*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('멀티미디어샵',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1912',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하3층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 09:00 ~ 18:30 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 10:00 ~ 18:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //멀티미디어샵
                ],
              ),
            ],
          ),
        )
    );
  }
}