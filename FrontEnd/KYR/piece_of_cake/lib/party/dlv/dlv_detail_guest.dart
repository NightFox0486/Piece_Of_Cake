import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/party/buy/buy_create.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../chat/chat_list_my.dart';
import '../../models/kakao_login_model.dart';
import '../../report.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../vo.dart';

class DlvDetailGuest extends StatefulWidget {
  // final PartyResVO partyResVO;
  final Party party;
  // final UserResVO writer;
  const DlvDetailGuest(
      // {Key? key, required this.partyResVO, required this.writer})
      {Key? key, required this.party})
  : super(key: key
  );

  @override
  State<DlvDetailGuest> createState() => _DlvDetailGuestState();
}

class _DlvDetailGuestState extends State<DlvDetailGuest> {
  int activeIndex = 0;
  final urlImages = [
    'assets/images/harry.png',
    'assets/images/harry.png',
    'assets/images/harry.png',
    'assets/images/harry.png',
    'assets/images/harry.png',
  ];

  final List<String> sins = [
    '부정적인 태도',
    '자리비움',
    '의도적으로 적에게 죽어줌',
    '욕설',
    '혐오발언',
  ];
  String? selectedValue;

  final formKey = GlobalKey<FormState>();


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
    var kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    // kakaoUserProvider.setCurrentPartyWriter(widget.partyResVO.userSeq);
    // var writer = kakaoUserProvider.writer;
    return Scaffold(
      appBar: AppBar(
        title: Text('BuyDetailGuest'),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.edit),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => BuyCreate()),
          //     );
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.gavel),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(10.0))),
                    content: Builder(
                      builder: (context) {
                        // Get available height and width of the build area of this widget. Make a choice depending on the size.
                        var height = MediaQuery.of(context).size.height;
                        var width = MediaQuery.of(context).size.width;

                        return SizedBox(
                          height: height - 200,
                          width: width - 100,
                          child: Column(
                            children: [
                              Text('게시글 신고', style: TextStyle(fontSize: 25),),
                              DropdownButtonHideUnderline(
                                child: DropdownButtonFormField2(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Sin',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Theme
                                          .of(context)
                                          .hintColor,
                                    ),
                                  ),
                                  items: sins
                                      .map((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  },
                                  // buttonHeight: 40,
                                  // buttonWidth: 140,
                                  itemHeight: 40,
                                ),
                              ),
                              Form(
                                  key: formKey,
                                  child: Expanded(
                                    child: SizedBox(
                                      child: TextFormField(
                                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
                                        maxLines: 20,
                                        onSaved: (val) {},
                                        validator: (val) {
                                          return null;
                                        },
                                      ),
                                    ),
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                              ),
                              SizedBox(
                                height: 50,
                                width: 130,
                                child: ElevatedButton(
                                  onPressed: () {

                                  },

                                  child: Text('신고하기',
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                  ),
                                ),
                              )


                            ],
                          ),
                        );
                      },
                    ),
                  )
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
                                  Text('${widget.party.userResVO.userNickname}', style: TextStyle(fontSize: 25),)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.person, size: 40),
                                  Text('${widget.party.partyMemberNumCurrent}/${widget.party.partyMemberNumTotal}', style: TextStyle(fontSize: 25))
                                ],
                              )
                            ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                '${widget.party.partyRegDt[0]}/'+
                                    '${widget.party.partyRegDt[1]}/'+
                                    '${widget.party.partyRegDt[2]} '+
                                    '${widget.party.partyRegDt[3]}:'+
                                    '${widget.party.partyRegDt[4]}:'+
                                    '${widget.party.partyRegDt[5]}'
                            )
                          ],
                        ),
                        Text('${widget.party.partyTitle}',
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
                                    Text('${(int.parse(widget.party.totalAmount)/widget.party.partyMemberNumTotal).ceil()}원', style: TextStyle(fontSize: 20)),
                                    Text('1인 금액', style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${widget.party.totalAmount}원', style: TextStyle(fontSize: 20)),
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
                                '${widget.party.partyContent}',
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
                                    child: Container(
                                      // todo: map
                                    ),
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
                              child: Text('대화 걸기',
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
                              child: Text('파티 참여',
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
