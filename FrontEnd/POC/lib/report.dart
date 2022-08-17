import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportSeq'] = this.reportSeq;
    data['reportedUserSeq'] = this.reportedUserSeq;
    data['reportingUserSeq'] = this.reportingUserSeq;
    data['reportContent'] = this.reportContent;
    data['crimeName'] = this.crimeName;
    return data;
  }
}
