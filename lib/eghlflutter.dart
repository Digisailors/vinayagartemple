 import 'dart:async';

import 'package:flutter/services.dart';

class Eghlflutter {
  static const MethodChannel _channel =
      const MethodChannel('eghlflutter');

//  static var platformVersion;
  
  static Future<String> executePayment(Map<String, dynamic> params) async {
    return await _channel.invokeMethod("executePayment", params);
  }
  
}
