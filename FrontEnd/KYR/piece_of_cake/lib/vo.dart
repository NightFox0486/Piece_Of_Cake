class Party {
  int partySeq;
  int userSeq;
  String partyTitle;
  String partyContent;
  List<dynamic> partyRegDt;
  List<dynamic> partyUpdDt;
  List<dynamic> partyRdvDt;
  String partyRdvLat;
  String partyRdvLng;
  int partyMemberNumTotal;
  int partyMemberNumCurrent;
  String partyAddr;
  String partyAddrDetail;
  int partyStatus;
  String itemLink;
  String totalAmount;
  Party({
    required this.partySeq,
    required this.userSeq,
    required this.partyTitle,
    required this.partyContent,
    required this.partyRegDt,
    required this.partyUpdDt,
    required this.partyRdvDt,
    required this.partyRdvLat,
    required this.partyRdvLng,
    required this.partyMemberNumTotal,
    required this.partyMemberNumCurrent,
    required this.partyAddr,
    required this.partyAddrDetail,
    required this.partyStatus,
    required this.itemLink,
    required this.totalAmount
  });

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      partySeq: json['partySeq'],
      userSeq: json['userSeq'],
      partyTitle: json['partyTitle'],
      partyContent: json['partyContent'],
      partyRegDt: json['partyRegDt'],
      partyUpdDt: json['partyUpdDt'],
      partyRdvDt: json['partyRdvDt'],
      partyRdvLat: json['partyRdvLat'],
      partyRdvLng: json['partyRdvLng'],
      partyMemberNumTotal: json['partyMemberNumTotal'],
      partyMemberNumCurrent: json['partyMemberNumCurrent'],
      partyAddr: json['partyAddr'],
      partyAddrDetail: json['partyAddrDetail'],
      partyStatus: json['partyStatus'],
      itemLink: json['itemLink'],
      totalAmount: json['totalAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partySeq'] = this.partySeq;
    data['userSeq'] = this.userSeq;
    data['partyTitle'] = this.partyTitle;
    data['partyContent'] = this.partyContent;
    data['partyRegDt'] = this.partyRegDt;
    data['partyUpdDt'] = this.partyUpdDt;
    data['partyRdvDt'] = this.partyRdvDt;
    data['partyRdvLat'] = this.partyRdvLat;
    data['partyRdvLng'] = this.partyRdvLng;
    data['partyMemberNumTotal'] = this.partyMemberNumTotal;
    data['partyMemberNumCurrent'] = this.partyMemberNumCurrent;
    data['partyAddr'] = this.partyAddr;
    data['partyAddrDetail'] = this.partyAddrDetail;
    data['partyStatus'] = this.partyStatus;
    data['itemLink'] = this.itemLink;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class UserReqVO {
  String? userEmail;
  String? userPhone;
  String? userNickname;
  String? userPassword;
  String? userImage;
  int? userRating;
  String? userLat;
  String? userLng;
  String? userAccount;

  UserReqVO(
      this.userEmail,
      this.userPhone,
      this.userNickname,
      this.userPassword,
      this.userImage,
      this.userRating,
      this.userLat,
      this.userLng,
      this.userAccount,
      );

  UserReqVO.fromJson(Map<String, dynamic> json) {
    userEmail = json['userEmail'];
    userPhone = json['userPhone'];
    userNickname = json['userNickname'];
    userPassword = json['userPassword'];
    userImage = json['userImage'];
    userRating = json['userRating'];
    userLat = json['userLat'];
    userLng = json['userLng'];
    userAccount = json['userAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    data['userNickname'] = this.userNickname;
    data['userPassword'] = this.userPassword;
    data['userImage'] = this.userImage;
    data['userRating'] = this.userRating;
    data['userLat'] = this.userLat;
    data['userLng'] = this.userLng;
    data['userAccount'] = this.userAccount;
    return data;
  }
}

class User {
  int userSeq;
  String userEmail;
  String userPhone;
  String userNickname;
  String userPassword;
  String userImage;
  int userRating;
  String userLat;
  String userLng;
  String userAccount;

  User({
    required this.userSeq,
    required this.userEmail,
    required this.userPhone,
    required this.userNickname,
    required this.userPassword,
    required this.userImage,
    required this.userRating,
    required this.userLat,
    required this.userLng,
    required this.userAccount,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userSeq: json['userSeq'],
      userEmail: json['userEmail'],
      userPhone: json['userPhone'],
      userNickname: json['userNickname'],
      userPassword: json['userPassword'],
      userImage: json['userImage'],
      userRating: json['userRating'],
      userLat: json['userLat'],
      userLng: json['userLng'],
      userAccount: json['userAccount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userSeq'] = this.userSeq;
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    data['userNickname'] = this.userNickname;
    data['userPassword'] = this.userPassword;
    data['userImage'] = this.userImage;
    data['userRating'] = this.userRating;
    data['userLat'] = this.userLat;
    data['userLng'] = this.userLng;
    data['userAccount'] = this.userAccount;
    return data;
  }
}
