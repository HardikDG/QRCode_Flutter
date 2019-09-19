import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:show_qrcode/show_qrcode.dart';

void main() {
  const MethodChannel channel = MethodChannel('show_qrcode');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
//    expect(await ShowQrcode.platformVersion, '42');
  });
}
