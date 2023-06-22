import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OBoarding extends StatelessWidget {
  const OBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.all(60), child: const Text("Hi")),
    );
  }
}
