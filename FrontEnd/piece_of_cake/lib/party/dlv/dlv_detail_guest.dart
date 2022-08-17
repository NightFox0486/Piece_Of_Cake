import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../chat/chat_route.dart';
import '../../models/kakao_login_model.dart';
import '../../models/party_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../vo.dart';

class DlvDetailGuest extends StatefulWidget {
  final Party party;
  const DlvDetailGuest(
      {Key? key, required this.party})
  : super(key: key
  );

  @override
  State<DlvDetailGuest> createState() => _DlvDetailGuestState();
}

class _DlvDetailGuestState extends State<DlvDetailGuest> {
  final _database = FirebaseFirestore.instance;
  int activeIndex = 0;

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

  var urlImages = [];

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
      effect: JumpingDotEffect(
        dotWidth: 20,
        dotHeight: 20,
      )
  );

  List<int> partySeqListGuest = [];
  List<PartyResVO> partyResVOGuestList = [];
  List<int> bookmarkList = [];

  void setList(kakaoUserProvider, partyProvider) async {
    await partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO.userSeq);
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO.userSeq);
    bookmarkList = partyProvider.bookmarkList;
    await partyProvider.fetchPartyGuestList(kakaoUserProvider.userResVO.userSeq);
    partyResVOGuestList = partyProvider.partyResVOGuestList;
    await partyProvider.fetchPartyPhotoList(widget.party.partySeq);
    urlImages = partyProvider.partyPhotoFileUrlList;
    List<int> list = [];
    for (PartyResVO partyResVO in partyResVOGuestList) {
      list.add(partyResVO.partySeq);
    }
    partySeqListGuest = list;
    setState(() {

    });
  }

  void loadSetState(partyProvider, partySeq) async {
    await partyProvider.fetchDetailParty(partySeq);
    widget.party.partyMemberNumCurrent = partyProvider.currentParty.partyMemberNumCurrent;
    setState(() {
    });
  }

  Widget build(BuildContext context) {
    var kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    var partyProvider = Provider.of<PartyModel>(context);
    void _createChatRoom() async{
      String? chatName =
          'H' + widget.party.userResVO.userKakaoLoginId.toString() +
              "G" + kakaoUserProvider.userResVO!.userKakaoLoginId.toString() +
              "P" + widget.party.partySeq.toString();

      await _database.collection('chats').doc(chatName).set({
        'created_at': Timestamp.now(),
        'guestNickname': kakaoUserProvider.user?.kakaoAccount?.profile?.nickname,
        'guestSeq': kakaoUserProvider.userResVO!.userKakaoLoginId,
        'hostNickname': widget.party.userResVO.userNickname,
        'hostSeq': widget.party.userResVO.userKakaoLoginId,
        'last_text': ' ',
        'last_message_at': Timestamp.now(),
        'partyseq': widget.party.partySeq,
        'chatroomName': chatName,
        'seq': FieldValue.arrayUnion([widget.party.userResVO.userKakaoLoginId, kakaoUserProvider.userResVO!.userKakaoLoginId])
      }, SetOptions(merge: true));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatRoute(chatId: chatName)),
      );
    }
    setList(kakaoUserProvider, partyProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('BuyDetailGuest'),
        actions: [
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
                                  CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.transparent,
                                      child: SizedBox(
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: kakaoUserProvider.user?.kakaoAccount?.profile?.profileImageUrl ?? '',
                                            placeholder: (context, url) => new CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => new Icon(Icons.error, size: 100,),
                                          ),
                                        ),
                                      )
                                  ),
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
                        Container(
                          margin: EdgeInsets.all(1),
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
                  height: 70,
                  margin: EdgeInsets.only(bottom: 7),
                    child: LikeButton(
                      onTap: (bool isLiked) async {
                        var bookmarkReqVO = BookmarkReqVO(
                          userSeq: kakaoUserProvider.userResVO!.userSeq,
                          partySeq: widget.party.partySeq,
                        );
                        if (isLiked) {
                          // todo: delete bookmark
                          await partyProvider.deleteBookmark(bookmarkReqVO);
                        } else {
                          // todo: insert bookmark
                          await partyProvider.insertBookmark(bookmarkReqVO);
                        }
                        // setBookmark(kakaoUserProvider, partyProvider);
                        setState(() {});
                        loadSetState(partyProvider, widget.party.partySeq);
                      },
                      bubblesSize: 0,
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          bookmarkList.contains(widget.party.partySeq) ? Icons.favorite : Icons.favorite_border,
                          color: Colors.deepPurpleAccent,
                          size: 40,
                        );
                      },
                      isLiked: bookmarkList.contains(widget.party.partySeq) ? true : false,
                      // likeCount: widget.party.partyBookmarkCount,
                    ),
                ),
              ),
              Flexible(flex: 8,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 135.0,
                          height: 60.0,
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          child: SizedBox.expand(
                            child: OutlinedButton(
                              onPressed: () async {
                                _createChatRoom();
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
                          width: 135.0,
                          height: 60.0,
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          child: SizedBox.expand(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (partySeqListGuest.contains(widget.party.partySeq)) {
                                  if (widget.party.partyStatus==2) {
                                    // '파티 성사': 파티 성사
                                  } else {
                                    // '참여 취소': 파티 모집중 & 참여 ㅇㅇ 상태
                                    await partyProvider.deleteMyParty(widget.party.partySeq, kakaoUserProvider.userResVO!.userSeq);
                                  }
                                } else {
                                  // '파티 참여': 파티 모집중 & 참여 ㄴㄴ 상태
                                  await partyProvider.insertMyParty(widget.party.partySeq, kakaoUserProvider.userResVO!.userSeq);
                                }
                                setState(() { });
                                loadSetState(partyProvider, widget.party.partySeq);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                primary: partySeqListGuest.contains(widget.party.partySeq) ? widget.party.partyStatus==2 ? Colors.grey : Colors.cyan : Colors.pink,
                              ),
                              // todo: 파티 참여 / 참여 취소 (모집중일때만 가능)
                              child: Text(partySeqListGuest.contains(widget.party.partySeq) ? (widget.party.partyStatus==2 ? '파티 성사' : '참여 취소') : '파티 참여',
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
