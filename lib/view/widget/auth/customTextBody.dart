import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  CustomBodyAuth({super.key, this.body});
  String? body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        body!,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      ),
    );
  }
}
