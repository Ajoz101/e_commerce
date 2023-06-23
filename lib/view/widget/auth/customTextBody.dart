import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  CustomBodyAuth({super.key, this.body});
  String? body;
  @override
  Widget build(BuildContext context) {
    return Text(
      body!,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}
