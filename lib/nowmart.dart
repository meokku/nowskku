import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowMart extends StatefulWidget {
  const SKKUNowMart({super.key});

  @override
  State<SKKUNowMart> createState() => _SKKUNowMartState();
}

class _SKKUNowMartState extends State<SKKUNowMart> {
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

  Widget isOpen(Open, Close, VacOpen, VacClose) {
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
          var openTime = Open*60;
          var closeTime = Close*60;
          if ((day=='Sat')||(day=='Sun')||(_isDayOff)) return close;
          if (_isChecked) {
            openTime = VacOpen*60;
            closeTime = VacClose*60;
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
            '실시간 편의점/매점 현황',
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: open),
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('중앙학술정보관 매점',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('02-740-1932',
                          style: TextStyle(
                              fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('중앙학술정보관 1층 까페테리아'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('24시간 운영',
                      style: TextStyle(
                          color: Colors.black45
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 3.0),
                          child: open),
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('법학관 매점',
                          style: TextStyle(
                            fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('02-740-1934',
                          style: TextStyle(
                              fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('법학관 지하2층 식당/매점'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('24시간 운영',
                      style: TextStyle(
                          color: Colors.black45
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      isOpen(8,20,10,16),
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('수선관 매점',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('02-740-1936',
                          style: TextStyle(
                              fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('수선관(별관) 5층'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('(학기중) 평일 08:00 ~ 20:00 주말 및 공휴일 휴무\n(방학중) 평일 10:00 ~ 16:00 주말 및 공휴일 휴무',
                    style: TextStyle(
                      color: Colors.black45
                    ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      isOpen(8,20,8,19),
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('경영관 CU',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('02-740-1931',
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
                    padding: const EdgeInsets.only(left: 50.0),
                    child: const Text('(학기중) 평일 08:00 ~ 20:00 주말 및 공휴일 휴무\n(방학중) 평일 08:00 ~ 19:00 주말 및 공휴일 휴무',
                      style: TextStyle(
                          color: Colors.black45
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      isOpen(8,20,10,19),
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('퇴계인문관 CU',
                          style: TextStyle(
                            fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('02-740-1935',
                          style: TextStyle(
                              fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('퇴계인문관'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('(학기중) 평일 08:00 ~ 20:00 주말 및 공휴일 휴무\n(방학중) 평일 10:00 ~ 19:00 주말 및 공휴일 휴무',
                      style: TextStyle(
                          color: Colors.black45
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}