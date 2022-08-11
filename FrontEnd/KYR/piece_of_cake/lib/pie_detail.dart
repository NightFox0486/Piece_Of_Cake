import 'package:flutter/material.dart';
import 'package:piece_of_cake/buy_create.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './chat_list_my.dart';

class PieDetail extends StatefulWidget {
  const PieDetail({Key? key}) : super(key: key);

  @override
  State<PieDetail> createState() => _PieDetailState();
}

class _PieDetailState extends State<PieDetail> {
  int activeIndex = 0;
  final urlImages = [
    'assets/images/harry.png',
    'assets/images/harry.png',
    'assets/images/harry.png',
    'assets/images/harry.png',
    'assets/images/harry.png',
  ];


  @override

  Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 6),
    color: Colors.white,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
            urlImage,
            fit: BoxFit.cover
        )
    ),

  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
      effect: JumpingDotEffect(
        dotWidth: 20,
        dotHeight: 20,
      )
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PieDetail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuyCreate()),
              );
            },
          ),
        ],
      ),
      body: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(10)
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 400,
                            enableInfiniteScroll: false,
                            // viewportFraction: 1,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                          itemCount: urlImages.length,
                          itemBuilder: (context, index, realIndex) {
                            final urlImage = urlImages[index];

                            return buildImage(urlImage, index);
                          },
                        ),
                        const SizedBox(height: 32),
                        buildIndicator(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.account_circle, size: 40,),
                                  Text('탕웨이', style: TextStyle(fontSize: 25),)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.person, size: 40),
                                  Text('2/4', style: TextStyle(fontSize: 25))
                                ],
                              )
                            ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('2022/08/08 11:08:08')
                          ],
                        ),
                        Text('해리가 너무 귀여워요 진짜 개 예뻐요',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(10)
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('4000원', style: TextStyle(fontSize: 20)),
                                    Text('1인 금액', style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('16000원', style: TextStyle(fontSize: 20)),
                                    Text('총 금액', style: TextStyle(fontSize: 20)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(10)
                        ),
                        Container(
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: Colors.black,
                          //       width: 1,
                          //     ),
                          //     borderRadius: BorderRadius.circular(10)
                          // ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '해리가 너무 예뻐요 꼭 자랑하고 싶었어요 탕웨이도 예뻐요 헤어질 결심 꼭 보세요 아직 늦지 않았어요 한산은 보지 마세요 재미 없어요',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                              )
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(10)
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text('만남 장소',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w200),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text('부산광역시 강서구 송정동 송정삼정그린코아더시티 로비 편의점 앞',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset('assets/images/harry.png',
                                      fit: BoxFit.fill,
                                    ), // Text(key['title']),
                                  ),

                                )
                              ],
                            )
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 10,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 2,
                child: Container(
                    height: 80,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatListMy()),
                      );

                    },
                      icon: Icon(Icons.question_answer, size: 35,),
                    )),
              ),
              Flexible(flex: 8,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 150.0,
                          height: 60.0,
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          child: SizedBox.expand(
                            child: OutlinedButton(
                              onPressed: () {

                              },
                              style: OutlinedButton.styleFrom(
                                shape: const RoundedRectangleBorder(

                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                ),
                                side: BorderSide(width: 5.0, color: Colors.amber),
                              ),
                              child: Text('파티 취소',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          )
                      ),
                      Container(
                          width: 150.0,
                          height: 60.0,
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          child: SizedBox.expand(
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  )
                              ),
                              child: Text('파티 성공',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          )
                      ),
                    ],

                  ))
            ],
          )
      ),
    );


  }
}
