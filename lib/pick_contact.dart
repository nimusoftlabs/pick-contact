import 'dart:async';
import 'package:flutter/services.dart';
import 'models/phone_number_model.dart';


class PickContact {
  static const MethodChannel _channel = MethodChannel('pick_contact');

  Future<Contacts> getContact() async {
    final Map<dynamic, dynamic> resE =
        await _channel.invokeMethod('getContact');
    if (resE == null) {
      return Future.value(null);
    }
    return Contacts.fromMap(resE);
  }
}

class Contacts {
  Contacts({
    this.fullName,
    this.phoneNumber,
  });
  String? fullName;

  String? phoneNumber;
  @override
  factory Contacts.fromMap(Map<dynamic, dynamic> map) => Contacts(
      fullName: map['fullName'],
      phoneNumber: PhoneNumber.fromMap(map['phoneNumber']).toString());
}
