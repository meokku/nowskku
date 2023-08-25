import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowLibrary extends StatefulWidget {
  const SKKUNowLibrary({super.key});

  @override
  State<SKKUNowLibrary> createState() => _SKKUNowLibraryState();
}

class _SKKUNowLibraryState extends State<SKKUNowLibrary> {
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
          if (time>=closeTime && time<openTime){
            return close;
          }
          return open;
        }
    );
  }

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
          if ((day=='Sun') || (_isDayOff)) return close;
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
  int _whatLibrary = 1;

  double menuBarLeft() {
    if (_whatLibrary==1) {
      return 0;
    }
    return 195;
  }
  double menuBarRight() {
    if (_whatLibrary==1) {
      return 195;
    }
    return 0;
  }

  Widget nowLibrary(){
    if(_whatLibrary==1){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isClosed(5*60,6*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 1층 제1열람실',
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
                  child: Text('06:00~익일05:00 (일요일 및 공휴일 포함)',
                    style: TextStyle(
                        color: Colors.black45
                    ),
                  ),
                ),
              ],
            ),
          ), //중앙학술정보관 1층 제1열람실
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isClosed(5*60,6*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 1층 제2열람실 (노트북)',
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
                  child: Text('06:00~익일05:00 (일요일 및 공휴일 포함)',
                    style: TextStyle(
                        color: Colors.black45
                    ),
                  ),
                ),
              ],
            ),
          ), //중앙학술정보관 1층 제2열람실 (노트북)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isClosed(5*60,6*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 1층 제3열람실 (노트북)',
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
                  child: Text('06:00~익일05:00 (일요일 및 공휴일 포함)',
                    style: TextStyle(
                        color: Colors.black45
                    ),
                  ),
                ),
              ],
            ),
          ), //중앙학술정보관 1층 제3열람실 (노트북)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(9*60,21*60,10*60,16*60+30,9*60,17*60,10*60,16*60+30),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 1층 제1, 3서고',
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('(학기중) ',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                      Text('평일 09:00 ~ 21:00, 토요일 10:00 ~ 16:30'
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
                      Text('평일 09:00 ~ 17:00, 토요일 10:00 ~ 16:30'
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
          ), //중앙학술정보관 1층 제1, 3서고
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(8*60,21*60+40,10*60,17*60,9*60,17*60+30,10*60,17*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 2층 국외자료실',
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('(학기중) ',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                      Text('평일 08:00 ~ 21:40, 토요일 10:00 ~ 17:00'
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
          ), //중앙학술정보관 2층 국외자료실
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(9*60,21*60,10*60,16*60+30,9*60,17*60,10*60,16*60+30),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 2층 제2서고',
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('(학기중) ',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                      Text('평일 09:00 ~ 21:00, 토요일 10:00 ~ 16:30'
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
                      Text('평일 09:00 ~ 17:00, 토요일 10:00 ~ 16:30'
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
          ), //중앙학술정보관 2층 제2서고
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(8*60,21*60+40,10*60,17*60,9*60,17*60+30,10*60,17*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 3층 Research Commons',
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('(학기중) ',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                      Text('평일 08:00 ~ 21:40, 토요일 10:00 ~ 17:00'
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
          ), //중앙학술정보관 3층 Research Commons
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(8*60,21*60+40,10*60,17*60,9*60,17*60+30,10*60,17*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 3층 킹고존',
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('(학기중) ',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                      Text('평일 08:00 ~ 21:40, 토요일 10:00 ~ 17:00'
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
          ), //중앙학술정보관 3층 킹고존
          Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(8*60,21*60+40,10*60,17*60,9*60,17*60+30,10*60,17*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 4층 국내자료실',
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('(학기중) ',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                      Text('평일 08:00 ~ 21:40, 토요일 10:00 ~ 17:00'
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
          ), //중앙학술정보관 4층 국내자료실
        ],
      );
    }
    else{
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isClosed(0*60,6*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('경영관 지하 1층 열람실',
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
                  child: Text('06:00~24:00 (일요일 및 공휴일 포함)',
                    style: TextStyle(
                        color: Colors.black45
                    ),
                  ),
                ),
              ],
            ),
          ), //경영관 지하 1층 열람실
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(8*60,21*60+40,10*60,17*60,9*60,17*60+30,10*60,17*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('법학관 5층 법학전문대학원도서관',
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('(학기중) ',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                      Text('평일 08:00 ~ 21:40, 토요일 10:00 ~ 17:00'
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
          ), //법학관 5층 법학전문대학원도서관
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(9*60,18*60,24*60,24*60,9*60+30,18*60,24*60,24*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('호암관 5층 수학교육과 도서실',
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('(학기중) ',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                      Text('평일 09:00 ~ 18:00 주말 및 공휴일 휴무',
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
                      Text('평일 09:30 ~ 18:00 주말 및 공휴일 휴무',
                        style: TextStyle(
                            color: Colors.black45
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), //수학교육과 도서실
        ],
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '실시간 도서관 현황',
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
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black54
                          ),
                            height: 60,
                            child: TextButton(
                              onPressed: (){
                                setState(() {
                                  _whatLibrary=1;
                                });
                              },
                              child: Text('중앙학술정보관',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17
                                ),
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent
                                ),
                              ),
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black54
                            ),
                            height: 60,
                            child: TextButton(
                              onPressed: (){
                                setState(() {
                                  _whatLibrary=3;
                                });
                              },
                              child: Text('그 외',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20
                                ),
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent
                                ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:55, left: menuBarLeft(), right: menuBarRight()),
                    child: Container(
                      color: Colors.white,
                      height: 5,
                      width: 200,
                    ),
                  )
                ],
              ),
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
              nowLibrary()
            ],
          ),
        )
    );
  }
}