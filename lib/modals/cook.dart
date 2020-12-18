import 'package:flutter/cupertino.dart';

class Cook {
  String name;
  String emailAddress;
  String phoneNumber;
  String uuid;
  String status;
  Cook({
    @required this.name,
    @required this.emailAddress,
    @required this.phoneNumber,
    @required this.uuid,
    
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "emailAddress": emailAddress,
      "phoneNumber": phoneNumber,
      "uuid": uuid,
      "status": "online",
    };
  }
}
