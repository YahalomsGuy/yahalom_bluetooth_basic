import 'package:bluetoothbasic/auto_detect.dart';
import 'package:bluetoothbasic/main_menu.dart';
import 'package:bluetoothbasic/search_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
          title: 'BLE Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => MainMenu(),
            '/search': (context) => SearchScreen(),
            '/auto': (context) => AutoDetect(),
          });
}
