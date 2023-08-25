import 'package:flutter/material.dart';
import 'nowshop.dart';
import 'nowbus.dart';
import 'nowmart.dart';
import 'nowcafe.dart';
import 'nowrestaurant.dart';
import 'nowmoney.dart';
import 'nowpc.dart';
import 'nowprinter.dart';
import 'nowedu.dart';
import 'nowhealth.dart';
import 'nowlibrary.dart';
import 'nowmartsuwon.dart';
import 'nowshopsuwon.dart';
import 'nowcafesuwon.dart';
import 'nowhealthsuwon.dart';
import 'nowdoctor.dart';
import 'nowrestrauntsuwon.dart';
import 'nowdoctorsuwon.dart';
import 'nowmoneysuwon.dart';
import 'nowpcsuwon.dart';

Color SKKUgreen = const Color.fromRGBO(141, 198, 63, 1);
Color SKKUgreen2 = const Color.fromRGBO(43, 102, 83, 1);
Color SKKUBlue = const Color.fromRGBO(7, 42, 92, 1);
Color SKKUOrange = const Color.fromRGBO(255, 108, 15, 1);
bool _isFirst=true;

// Color SKKUbackground(){
//   if (_isFirst) return SKKUgreen2;
//   return SKKUgreen;
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double menuBarLeft() {
    if (_isFirst) {
      return 0;
    }
    return 180;
  }
  double menuBarRight() {
    if (_isFirst) {
      return 180;
    }
    return 0;
  }

  Widget campus(_isFirst){
    if (_isFirst){
      return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,70,10,10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 105,
                              child: ElevatedButton(onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SKKUNowBus())
                                );
                              },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Column(
                                      children: [
                                        Icon(Icons.directions_bus_rounded,
                                          size: 40,),
                                        Text('인사캠 셔틀')
                                      ],
                                    ),
                                  )
                              ),
                            ), //인사캠 셔틀
                            SizedBox(
                              width: 105,
                              child: ElevatedButton(
                                  onPressed: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const SKKUNowMart())
                                      );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Column(
                                      children: [
                                        Icon(Icons.store_rounded,
                                          size: 40,)
                                        ,
                                        Text('매점/편의점')
                                      ],
                                    ),
                                  )
                              ),
                            ), //매점 편의점
                            SizedBox(
                              width: 105,
                              child: ElevatedButton(onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SKKUNowCafe()));
                              },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Column(
                                      children: [
                                        Icon(Icons.coffee_rounded,
                                          size: 40,),
                                        Text('커피점')
                                      ],
                                    ),
                                  )
                              ),
                            ), //커피점
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowShop()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.storefront_rounded,
                                            size: 40,),
                                          Text('복지 매장')
                                        ],
                                      ),
                                    )
                                ),
                              ), //복지 매장
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(
                                    onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const SKKUNowRestaurant()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.restaurant_rounded,
                                            size: 40,)
                                          ,
                                          Text('식당/음식점')
                                        ],
                                      ),
                                    )
                                ),
                              ), //식당/음식점
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowMoney()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.attach_money_rounded,
                                            size: 40,),
                                          Text('금융 시설')
                                        ],
                                      ),
                                    )
                                ),
                              ), //금융 시설
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowPC()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.computer_rounded,
                                            size: 40,),
                                          Text('PC실')
                                        ],
                                      ),
                                    )
                                ),
                              ), //PC실
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(
                                    onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const SKKUNowPrinter()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.print,
                                            size: 40,)
                                          ,
                                          Text('프린터/복사')
                                        ],
                                      ),
                                    )
                                ),
                              ), //프린터/복사
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowEdu()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.meeting_room_rounded,
                                            size: 40,),
                                          Text('학습 지원')
                                        ],
                                      ),
                                    )
                                ),
                              ), //학습 지원
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 120,
                                child: ElevatedButton(onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SKKUNowDoctor()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.health_and_safety_rounded,
                                            size: 40,),
                                          Text('건강센터')
                                        ],
                                      ),
                                    )
                                ),
                              ), //건강센터
                              SizedBox(
                                width: 90,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowHealth()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.monitor_heart_rounded,
                                            size: 40,),
                                          Text('제세동기')
                                        ],
                                      ),
                                    )
                                ),
                              ), //제세동기
                              SizedBox(
                                width: 120,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowLibrary()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.menu_book_rounded,
                                            size: 40,),
                                          Text('도서관/열람실')
                                        ],
                                      ),
                                    )
                                ),
                              ), //도서관/열람실
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
      );
    } else {
      return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,70,10,10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 105,
                              child: ElevatedButton(
                                  onPressed: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const SKKUNowMartSuwon())
                                      );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Column(
                                      children: [
                                        Icon(Icons.store_rounded,
                                          size: 40,)
                                        ,
                                        Text('매점/편의점')
                                      ],
                                    ),
                                  )
                              ),
                            ), //매점 편의점
                            SizedBox(
                              width: 105,
                              child: ElevatedButton(onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SKKUNowCafeSuwon()));
                              },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Column(
                                      children: [
                                        Icon(Icons.coffee_rounded,
                                          size: 40,),
                                        Text('커피점')
                                      ],
                                    ),
                                  )
                              ),
                            ), //커피점
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowShopSuwon()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.storefront_rounded,
                                            size: 40,),
                                          Text('복지 매장')
                                        ],
                                      ),
                                    )
                                ),
                              ), //복지 매장
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(
                                    onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const SKKUNowRestaurantSuwon()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.restaurant_rounded,
                                            size: 40,)
                                          ,
                                          Text('식당/음식점')
                                        ],
                                      ),
                                    )
                                ),
                              ), //식당/음식점
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowMoneySuwon()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.attach_money_rounded,
                                            size: 40,),
                                          Text('금융 시설')
                                        ],
                                      ),
                                    )
                                ),
                              ), //금융 시설
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowPCSuwon()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.computer_rounded,
                                            size: 40,),
                                          Text('PC실')
                                        ],
                                      ),
                                    )
                                ),
                              ), //PC실
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(
                                    onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const SKKUNowPrinter()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.print,
                                            size: 40,)
                                          ,
                                          Text('프린터/복사')
                                        ],
                                      ),
                                    )
                                ),
                              ), //프린터/복사
                              SizedBox(
                                width: 105,
                                child: ElevatedButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SKKUNowEdu()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.meeting_room_rounded,
                                            size: 40,),
                                          Text('학습 지원')
                                        ],
                                      ),
                                    )
                                ),
                              ), //학습 지원
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 120,
                                child: ElevatedButton(onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SKKUNowDoctorSuwon()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.health_and_safety_rounded,
                                            size: 40,),
                                          Text('건강센터')
                                        ],
                                      ),
                                    )
                                ),
                              ), //건강센터
                              SizedBox(
                                width: 90,
                                child: ElevatedButton(onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SKKUNowHealthSuwon()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.monitor_heart_rounded,
                                            size: 40,),
                                          Text('제세동기')
                                        ],
                                      ),
                                    )
                                ),
                              ), //제세동기
                              SizedBox(
                                width: 120,
                                child: ElevatedButton(onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SKKUNowLibrary()));
                                },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.menu_book_rounded,
                                            size: 40,),
                                          Text('도서관/열람실')
                                        ],
                                      ),
                                    )
                                ),
                              ), //도서관/열람실
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SKKUgreen2,
      appBar: AppBar(
          backgroundColor: SKKUgreen2,
          toolbarHeight: 125,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 70,
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 60,
                        child: TextButton(
                          onPressed: (){
                            setState(() {
                              _isFirst=true;
                            });
                          },
                          child: Text('인사캠',
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
                  Expanded(
                    child: SizedBox(
                        height: 60,
                        child: TextButton(
                          onPressed: (){
                            setState(() {
                              _isFirst=false;
                            });
                          },
                          child: Text('자과캠',
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
                padding: EdgeInsets.only(left: menuBarLeft(), right: menuBarRight()),
                child: Container(
                  color: Colors.white,
                  height: 5,
                  width: 150,
                ),
              )
            ],
          )
      ),
      body: campus(_isFirst)

    );
  }
}

