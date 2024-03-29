import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:show_qrcode/show_qrcode.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _imagePath;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

  }

  _testQR() async {
    _imagePath = await Qrcode.generateQRCode('Test message');
    setState(() {
    });
    print(_imagePath.path);

//    print(await Qrcode.generateQRCode('Test message'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(child: RaisedButton(child: Text('Click'), onPressed: _testQR)),
    _imagePath != null ? Image.file(_imagePath, height: 100,width: 100,) : Container()
            ],
          ),
        ),
      ),
    );
  }
}
