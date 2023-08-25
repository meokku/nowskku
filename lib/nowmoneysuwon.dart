import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowMoneySuwon extends StatefulWidget {
  const SKKUNowMoneySuwon({super.key});

  @override
  State<SKKUNowMoneySuwon> createState() => _SKKUNowMoneySuwonState();
}

class _SKKUNowMoneySuwonState extends State<SKKUNowMoneySuwon> {
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

  Widget isOpen(Open, Close, SatOpen,SatClose) {
    return TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          var localtime = DateTime
              .now()
              .toLocal();
          var day = DateFormat('E').format(localtime);
          var hour = localtime.hour;
          var minute=localtime.minute;
          var time=hour*60+minute;
          var openHour = Open;
          var closeHour = Close;
          if ((day=='Sun')||(_isDayOff)){
            return close;
          }
          else if (day=='Sat'){
            openHour = SatOpen;
            closeHour = SatClose;
          }
          if (time>=openHour && time<closeHour){
            return open;
          }
          return close;
        }
    );
  }
  Widget isClose(Open, Close) {
    return TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          var localtime = DateTime
              .now()
              .toLocal();
          var day = DateFormat('E').format(localtime);
          var hour = localtime.hour;
          var minute=localtime.minute;
          var time=hour*60+minute;
          var openHour = Open;
          var closeHour = Close;
          if (time>=openHour && time<closeHour){
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
            '실시간 금융 시설 현황',
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
                            padding: const EdgeInsets.only(right: 50,top: 10),
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
                        isOpen(9*60,18*60,24*60,24*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('우체국',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('031-290-5445',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('복지회관 1층'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('평일 09:00 ~ 18:00 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //우체국
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(9*60+30,15*60+30,24*60,24*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('우리은행',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('031-290-5434',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('복지회관 1층'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('평일 09:30 ~ 15:30 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //우리은행
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('후문 ATM',
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
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //후문 ATM
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('삼성학술정보관 ATM',
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
                      child: Text('삼성학술정보관'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //삼성학술정보관 ATM
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제1공학관23동 ATM',
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
                      child: Text('제1공학관23동 2층'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //제1공학관23동 ATM
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제2공학관26동 ATM',
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
                      child: Text('제2공학관26동 1층'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //제2공학관26동 ATM
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('학생회관 ATM',
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
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //학생회관 ATM
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('화학관 ATM',
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
                      child: Text('화학관 1층'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //화학관 ATM
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('복지회관 ATM',
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
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //복지회관 ATM
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('의관 ATM',
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
                      child: Text('기숙사의관 1층'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //의관 ATM
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
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('지관 ATM',
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
                      child: Text('기숙사지관 지하1층'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //지관 ATM
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: isClose(7*60,23*60+30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('신관 B동 ATM',
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
                      child: Text('기숙사신관 지하1층'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('매일 07:00 ~ 23:30',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ),
                  ],
                ),
              ), //신관 B동 ATM

            ],
          ),
        )
    );
  }
}