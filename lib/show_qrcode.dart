import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class Qrcode {
  static const MethodChannel _channel =
      const MethodChannel('qrcode');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<File> generateQRCode(message) async {
    final String qrImage = await _channel.invokeMethod('generateQRCode', {'message': message});
    return File(qrImage);
  }
}
