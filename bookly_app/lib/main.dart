import 'package:flutter/material.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(body: Center(child: Text('Hello Bookly App'))),
    );
  }
}
