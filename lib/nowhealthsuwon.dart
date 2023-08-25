import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

enum Day {None,Sat,Weekend}

class SKKUNowHealthSuwon extends StatefulWidget {
  const SKKUNowHealthSuwon({super.key});

  @override
  State<SKKUNowHealthSuwon> createState() => _SKKUNowHealthSuwonState();
}

class _SKKUNowHealthSuwonState extends State<SKKUNowHealthSuwon> {
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
          if (_isDay==Day.Weekend) return close;
          var localtime = DateTime
              .now()
              .toLocal();
          var hour = localtime.hour;
          var min = localtime.minute;
          var time = hour*60+min;
          var openTime = OpenTime;
          var closeTime = CloseTime;
          if (_isChecked) {
            openTime = VacOpenTime;
            closeTime = VacCloseTime;
            if (_isDay==Day.Sat) {
              openTime = VacSatOpen;
              closeTime = VacSatClose;
            }
          }
          else if (_isDay==Day.Sat){
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
  Day? _isDay = Day.None;

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
                      child: Text('제세동기(AED)_의학관',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('의학관 1층',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ), //의학관
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
                      child: Text('제세동기(AED)_N센터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('N센터 1층',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ), //N센터
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
                      child: Text('제세동기(AED)_반도체관',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('반도체관 1층',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ), //반도체관
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
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제세동기(AED)_제2공학관',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제2공학관26동 1층 경비실',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ), //제2공학관
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
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제세동기(AED)_제2과학관',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제2과학관32동 1층 경비실',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ), //제2과학관
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제세동기(AED)_삼성학술정보관',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('삼성학술정보관 1층',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ), //삼성학술정보관
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제세동기(AED)_학생회관',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('학생회관 1층 경비실',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ), //학생회관
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제세동기(AED)_산학협력센터',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('산학협력센터 2층',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ), //산학협력센터
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
                      child: Text('제세동기(AED)_기숙사인관',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('기숙사인관 1층',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ), //기숙사인관
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
                      child: Text('제세동기(AED)_기숙사의관',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('기숙사의관 1층',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ), //기숙사의관
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
                      child: Text('제세동기(AED)_기숙사예관',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('기숙사예관 1층',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ), //기숙사예관
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
                      child: Text('제세동기(AED)_기숙사지관',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('기숙사지관 1층',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ), //기숙사지관
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('제세동기(AED)_기숙사신관',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('기숙사신관 지하1층',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('기숙사신관 1층',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

          ), //기숙사신관
          Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isOpen(8*60,22*60,8*60,22*60,8*60,22*60,8*60,22*60),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('봉룡학사 신관 피트니스센터',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('02-760-0848',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('기숙사신관 지하1층'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('평일, 토요일 08:00 ~ 22:00'
                      '\n일요일 및 공휴일 휴무',
                    style: TextStyle(
                        color: Colors.black45
                    ),
                  ),
                ),
              ],
            ),
          ), //피트니스센터
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text(
            '제세동기 위치 및 \n실시간 피트니스센터 현황',
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
                              padding: const EdgeInsets.only(left:30,top: 20),
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
                          SizedBox(
                            height: 30,
                            width: 200,
                            child: ListTile(
                              title: Text('평일'),
                              leading: Radio<Day>(
                                  value: Day.None,
                                  groupValue: _isDay,
                                  onChanged: (value){
                                    setState(() {
                                      _isDay = value;
                                    });
                                  }
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 200,
                            child: ListTile(
                              title: Text('토요일'),
                              leading: Radio<Day>(
                                  value: Day.Sat,
                                  groupValue: _isDay,
                                  onChanged: (value){
                                    setState(() {
                                      _isDay = value;
                                    });
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SizedBox(
                              height: 30,
                              width: 200,
                              child: ListTile(
                                title: Text('일요일/공휴일'),
                                leading: Radio<Day>(
                                    value: Day.Weekend,
                                    groupValue: _isDay,
                                    onChanged: (value){
                                      setState(() {
                                        _isDay = value;
                                      });
                                    }
                                ),
                              ),
                            ),
                          ),
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