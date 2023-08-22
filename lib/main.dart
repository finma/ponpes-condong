import 'package:flutter/material.dart';
import 'package:ponpescondong/pages/splashscreen1.dart';
// import 'package:ponpescondong/webview_test.dart';
// import 'package:ponpescondong/webview.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen1(),
      // home: WebViewPage(),
    );
  }
}
