import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({super.key, this.title});
  String ?title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        title!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
