import 'package:e_commerce/view/widget/home/homeListView.dart';
import 'package:flutter/material.dart';

import '../../../core/functions/exitAlert.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () {
          return exitAlert();
        },
        child: const Scaffold(
          body: SafeArea(
            child: HomeListView(),
          ),
        ),
      ),
    );
  }
}
