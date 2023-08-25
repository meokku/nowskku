import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowEdu extends StatefulWidget {
  const SKKUNowEdu({super.key});

  @override
  State<SKKUNowEdu> createState() => _SKKUNowEduState();
}

class _SKKUNowEduState extends State<SKKUNowEdu> {
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
          var openTime = Open;
          var closeTime = Close;
          if ((day=='Sat')||(day=='Sun')||(_isDayOff)) return close;
          if (_isChecked) {
            openTime = VacOpen;
            closeTime = VacClose;
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
            '실시간 학습 지원 시설 현황',
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(9*60,17*60+30,9*60,17*60+30),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('분실물센터 (학생지원팀)',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('02-760-1077',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('600주년기념관'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('평일 09:00 ~ 17:30 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //분실물센터
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(12*60,18*60,12*60,18*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('의상학과 CAD실',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('02-760-0515',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('수선관(별관)'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('평일 12:00 ~ 18:00 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //의상학과 CAD실
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(9*60,21*60,9*60,21*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('수업행동분석실',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('02-760-0535',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('호암관 5층'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: const Text('평일 09:00 ~ 21:00 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //수업행동분석실
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(9*60,21*60,10*60,17*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('멀티미디어제작실',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('02-760-0679',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('호암관 2층 컴퓨터교육과 소프트웨어실습실'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('(학기중) 평일 09:00 ~ 21:00 주말 및 공휴일 휴무\n(방학중) 평일 10:00 ~ 17:00 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //멀티미디어제작실
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(9*60,18*60,9*60,18*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('프레쉬맨라운지',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('02-760-0996',
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
                      padding: const EdgeInsets.only(left: 50.0),
                      child: const Text('평일 09:00 ~ 18:00 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //수업행동분석실
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(9*60,21*60,9*60,18*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('사회과학대 실습실',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('02-760-0939',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('수선관'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('(학기중) 평일 09:00 ~ 21:00 주말 및 공휴일 휴무\n(방학중) 평일 09:00 ~ 18:00 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //사회과학대 실습실
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(8*60,21*60+30,9*60,21*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('교육장',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('02-760-1185',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('중앙학술정보관'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('(학기중) 평일 08:00 ~ 21:30 주말 및 공휴일 휴무\n(방학중) 평일 09:00 ~ 21:00 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //교육장
            ],
          ),
        )
    );
  }
}