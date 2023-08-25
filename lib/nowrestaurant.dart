import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowRestaurant extends StatefulWidget {
  const SKKUNowRestaurant({super.key});

  @override
  State<SKKUNowRestaurant> createState() => _SKKUNowRestaurantState();
}

class _SKKUNowRestaurantState extends State<SKKUNowRestaurant> {
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
            '실시간 식당/음식점 현황',
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
                            isOpen(8*60,18*60+30,24*60,24*60,11*60+30,18*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('은행골식당',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1926',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('600주년기념관 지하1층 '),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 08:00 ~ 18:30 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 11:30 ~ 18:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //은행골식당
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(8*60,19*60,24*60,24*60,11*60+30,19*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('옥류천식당',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1923',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('교수회관 1층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 08:00 ~ 19:00 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 11:30 ~ 19:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //옥류천식당
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(11*60,18*60+30,11*60,13*60,11*60,18*60+30,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('금잔디식당',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1927',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하2층'),
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
                              Text('평일 11:00 ~ 18:30, 토요일 11:00 ~ 13:00'
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
                            child: Text('(방학중) 평일 11:00 ~ 18:30 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //금잔디식당
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(11*60,13*60,24*60,24*60,11*60,13*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('법고을식당',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-740-1929',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('법학관 지하2층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일 11:00 ~ 13:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //법고을식당
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(10*60,15*60,24*60,24*60,10*60,14*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('맘스터치',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-745-0026',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('경영관 지하2층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('(학기중) 평일 10:00 ~ 15:00 주말 및 공휴일 휴무'
                                '\n(방학중) 평일 10:00 ~ 14:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //맘스터치
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,19*60,24*60,24*60,9*60,19*60,24*60,24*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('서브웨이',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-3673-0100',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('600주년기념관 지하1층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일 09:00 ~ 19:00 주말 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //서브웨이
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isOpen(9*60,19*60,10*60,14*60,9*60,19*60,10*60,14*60),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('뉴욕버거',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('02-765-5411',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('600주년기념관 지하1층'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text('평일 09:00 ~ 19:00 토요일 10:00 ~ 14:00'
                                '\n일요일 및 공휴일 휴무',
                              style: TextStyle(
                                  color: Colors.black45
                              ),
                            )
                        ),
                      ],
                    ),
                  ), //뉴욕버거
                ],
              ),
            ],
          ),
        )
    );
  }
}