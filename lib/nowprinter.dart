import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class SKKUNowPrinter extends StatefulWidget {
  const SKKUNowPrinter({super.key});

  @override
  State<SKKUNowPrinter> createState() => _SKKUNowPrinterState();
}

class _SKKUNowPrinterState extends State<SKKUNowPrinter> {
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
  bool _isChecked = true;

  Widget printerInfo(){
    if (_isChecked){
      return Column(
        children: [
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
                      child: Text('양현관 2F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백, 스캔'),
                ),
              ],
            ),
          ), //양현관 2F 프린터
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
                      child: Text('중앙학술정보관 1F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백, 스캔'),
                ),
              ],
            ),
          ), //중앙학술정보관 1F 프린터
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
                      child: Text('중앙학술정보관 3F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백, 컬러, 스캔'),
                ),
              ],
            ),
          ), //중앙학술정보관 3F 프린터
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
                      child: Text('국제관 1F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 컬러, 스캔'),
                ),
              ],
            ),
          ), //국제관 1F 프린터
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
                      child: Text('국제관 지하 2F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 컬러, 스캔'),
                ),
              ],
            ),
          ), //국제관 지하 2F 프린터
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
                      child: Text('수선관 1F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //수선관 1F 프린터
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
                      child: Text('수선관 5F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //수선관 5F 프린터
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
                      child: Text('다산경제관 2F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //다산경제관 2F 프린터
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
                      child: Text('다산경제관 4F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //다산경제관 4F 프린터
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
                      child: Text('퇴계인문관 3F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백, 스캔'),
                ),
              ],
            ),
          ), //퇴계인문관 3F 프린터
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
                      child: Text('법학관 지하 1F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백, 스캔'),
                ),
              ],
            ),
          ), //법학관 지하 1F 프린터
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
                      child: Text('경영관 1F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백, 컬러, 스캔'),
                ),
              ],
            ),
          ), //경영관 1F 프린터
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
                      child: Text('호암관 2F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //호암관 2F 프린터
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
                        child: isOpen(9*60,18*60+30)),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('경영관 복사실',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-740-1917',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('평일 09:00 ~ 18:30 주말 및 공휴일 휴무',
                    style: TextStyle(
                        color: Colors.black45
                    ),
                  ),
                ),
              ],
            ),
          ), //경영관 복사실
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
                        child: isOpen(9*60,18*60+30)),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('경영관 지하 2F 복사실',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-766-0767',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('평일 09:00 ~ 18:30 주말 및 공휴일 휴무',
                    style: TextStyle(
                        color: Colors.black45
                    ),
                  ),
                ),
              ],
            ),
          ), //경영관 지하 2F 복사실
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
                        child: isOpen(10*60,15*60)),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('중앙학술정보관 복사실',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-743-6253',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('평일 10:00 ~ 15:00 주말 및 공휴일 휴무',
                    style: TextStyle(
                        color: Colors.black45
                    ),
                  ),
                ),
              ],
            ),
          ), //중앙학술정보관 복사실
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
                        child: isOpen(9*60,17*60+30)),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('법학관 지하2층 복사실',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-740-1915',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
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
          ), //법학관 지하2층 복사실
        ],
      );
    } else {
      return Column(
        children: [
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
                      child: Text('K-하우스 1F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백, 스캔'),
                ),
              ],
            ),
          ), //k하 프린터
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
                      child: Text('E 하우스 B동 별관 1층 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //E 하우스 B동 별관 1층 프린터
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
                      child: Text('E 하우스 A동 본관 2층 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //E 하우스 B동 별관 1층 프린터
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
                      child: Text('I-하우스 1F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //I-하우스 1F 프린터
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
                      child: Text('G-하우스 지하 1F 프린터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백'),
                ),
              ],
            ),
          ), //G-하우스 지하 1F 프린터
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
                      child: Text('C-하우스 1F 프린터	',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-3281-0766',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('(무인) 흑백, 스캔'),
                ),
              ],
            ),
          ), //C-하우스 1F 프린터
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '실시간 프린터/복사실 현황',
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
                            Padding(
                              padding: const EdgeInsets.only(left:30,top: 5),
                              child: Row(
                                children: [
                                  Text('기숙사'),
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
                                  Text('교내')
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
              printerInfo()
            ],
          ),
        )
    );
  }
}