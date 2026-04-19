import 'package:bookly_app/Features/home/View/widgets/CustomDetailsAppBar.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [const CustomDetailsAppBar()]));
  }
}
