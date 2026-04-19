import 'package:bookly_app/Core/Utilits/styles.dart';
import 'package:flutter/material.dart';

class CustomContainerDetailBody extends StatelessWidget {
  const CustomContainerDetailBody({
    super.key,
    required this.color,
    this.text,
    required this.isLeft,
    this.textColor,
  });
  final Color color;
  final String? text;
  final bool isLeft;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * .2,
      height: MediaQuery.of(context).size.height * .08,
      decoration: BoxDecoration(
        color: color,
        borderRadius: isLeft
            ? const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
      ),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Text(
            text ?? "19.99\$",
            style: Styles.textStyle18.copyWith(
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
