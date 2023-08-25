import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowMoney extends StatefulWidget {
  const SKKUNowMoney({super.key});

  @override
  State<SKKUNowMoney> createState() => _SKKUNowMoneyState();
}

class _SKKUNowMoneyState extends State<SKKUNowMoney> {
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

  Widget isOpen(Open, Close) {
    return TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          var localtime = DateTime
              .now()
              .toLocal();
          var day = DateFormat('E').format(localtime);
          var hour = localtime.hour;
          var openHour = Open;
          var closeHour = Close;
          if ((day=='Sat')||(day=='Sun')||(_isDayOff)) return close;
          if (hour>=openHour && hour<closeHour){
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
        body: Column(
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
                      isOpen(9,18,),
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
                        child: Text('02-740-1900',
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
                      isOpen(9,16,),
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
                        child: Text('02-740-1924',
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
                    child: Text('평일 09:00 ~ 16:00 주말 및 공휴일 휴무',
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
                          child: open),
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('우리은행 ATM',
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
                    child: Text('학생회관 3층'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('중앙학술정보관-교수회관 사이'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('법학관 1층'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('수선관 5층'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('다산경제관 1층'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('국제관'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('600주년기념관 1층'),
                  ),
                ],
              ),
            ), //우리은행 ATM
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
                        child: Text('신한은행 ATM',
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
                    child: Text('다산경제관-인문관 사이'),
                  ),
                ],
              ),
            ), //신한은행 ATM
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
                        child: Text('우리은행,국민은행 ATM',
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
                    child: Text('경영관 지하1층'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('교수회관 2층'),
                  ),
                ],
              ),
            ), //우리은행,국민은행 ATM
          ],
        )
    );
  }
}