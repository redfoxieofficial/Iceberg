// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_new

import 'package:app/giris_ekrani.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
  //configLoading();
}

// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
//     ..loadingStyle = EasyLoadingStyle.custom
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..progressColor = Colors.green
//     ..backgroundColor = Colors.green
//     ..indicatorColor = Colors.green
//     ..textColor = Colors.white
//     ..maskColor = Colors.blue.withOpacity(0.5)
//     ..userInteractions = true
//     ..dismissOnTap = true;
// }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioCache audioCache = AudioCache();
  @override
  void initState() {
    super.initState();
    audioCache.load("giris.mp3");
    audioCache.loop("giris.mp3");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Material App',
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 93, 243, 245)),
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('Buz Dağı', style: TextStyle(fontStyle: FontStyle.normal)),
          backgroundColor: Colors.black,
          foregroundColor: Color.fromARGB(255, 80, 200, 255),
          actions: <Widget>[
            PopupMenuButton<int>(
              icon: Icon(Icons.home),
              iconSize: 42,
              padding: EdgeInsets.only(right: 20),
              onSelected: (item) {},
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Ana Sayfa')),
              ],
            ),
          ],
        ),
        body: giris_ekrani(),
      ),
    );
  }
}

// build\app\outputs\flutter-apk\app-release.apk
