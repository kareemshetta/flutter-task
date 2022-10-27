import 'package:flutter/material.dart';

class TitleSplittedWidget extends StatelessWidget {
  const TitleSplittedWidget({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            color: Color(0xffF5F5F5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Text(
          title,
          style: TextStyle(color: Color(0xff888888), fontSize: 12),
        ),
      ),
    );
  }
}
