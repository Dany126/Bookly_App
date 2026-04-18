import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),

      debugShowCheckedModeBanner: false,
      title: 'Bookly App',

      home: const Scaffold(body: Center(child: Text('Hello Bookly App'))),
    );
  }
}
