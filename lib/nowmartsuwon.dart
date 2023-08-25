import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowMartSuwon extends StatefulWidget {
  const SKKUNowMartSuwon({super.key});

  @override
  State<SKKUNowMartSuwon> createState() => _SKKUNowMartSuwonState();
}

class _SKKUNowMartSuwonState extends State<SKKUNowMartSuwon> {
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
  Widget isClosed(closeTime,openTime){
    return TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          var localtime = DateTime
              .now()
              .toLocal();
          var hour = localtime.hour;
          var min = localtime.minute;
          var time = hour*60+min;
          if (time>=closeTime || time<openTime){
            return close;
          }
          return open;
        }
    );
  }
  Widget isOpen(OpenTime,CloseTime,SatOpenTime,SatCloseTime,SunOpenTime,SunCloseTime,VacOpenTime,VacCloseTime,VacSatOpen,VacSatClose,VacSunOpen,VacSunClose) {
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
          if ((_isDayOff)&&(SunOpenTime==24*60)) return close;
          if (_isChecked) {
            openTime = VacOpenTime;
            closeTime = VacCloseTime;
            if (day=='Sat') {
              openTime = VacSatOpen;
              closeTime = VacSatClose;
            }
            else if (day=='Sun') {
              openTime = VacSunOpen;
              closeTime = VacSunClose;
            }
          }
          else if (day=='Sat'){
            openTime = SatOpenTime;
            closeTime = SatCloseTime;
          }
          else if (day=='Sun'){
            openTime=SunOpenTime;
            closeTime=SunCloseTime;
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
                          child: Text('기숙사 의관 GS25',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('031-292-2745',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('기숙사 의관 1층'),
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
              ), //기숙사 의관 GS25
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(7*60,23*60+30,7*60,23*60+30,7*60,23*60+30,7*60,23*60,7*60,23*60+30,7*60,23*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('기숙사 신관 GS25',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('031-291-2745',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('기숙사 신관 지하1층'),
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
                          Text('매일 07:00 ~ 23:30',
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
                          Text('평일, 일요일 07:00 ~ 23:00'
                              '\n토요일 07:00 ~ 23:30',
                            style: TextStyle(
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ), //기숙사 신관 GS25
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(7*60,23*60+30,7*60,23*60+30,7*60,23*60+30,7*60,23*60,7*60,23*60+30,7*60,23*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('기숙사 지관 GS25',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('031-291-2745',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('기숙사 지관 지하1층'),
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
                          Text('매일 07:00 ~ 23:30',
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
                          Text('평일, 일요일 07:00 ~ 23:00'
                              '\n토요일 07:00 ~ 23:30',
                            style: TextStyle(
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ), //기숙사 지관 GS25
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(9*60,18*60+30,24*60,24*60,24*60,24*60,10*60,18*60+30,24*60,24*60,24*60,24*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('공대매점',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('031-290-5442',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('제2공학관26동 지하1층'),
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
                          Text('평일 09:00 ~ 18:30 주말 및 공휴일 휴무',
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
                          Text('평일 10:00 ~ 18:30 주말 및 공휴일 휴무',
                            style: TextStyle(
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ), //공대매점(편의점)
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isOpen(7*60,22*60,7*60,18*60,24*60,24*60,8*60,22*60,8*60,18*60,24*60,24*60),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('복지회관 GS25',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('031-292-4151',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('복지회관 지하1층'),
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
                          Text('평일 07:00 ~ 22:00 토요일 07:00 ~ 18:00,'
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
                          Text('평일 08:00 ~ 22:00, 토요일 08:00 ~ 18:00'
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
              ), //복지회관 GS25
            ],
          ),
        )
    );
  }
}