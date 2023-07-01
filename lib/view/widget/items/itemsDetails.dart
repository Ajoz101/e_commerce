import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.white,
          ),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Item Description :\n",
                  style: TextStyle(fontSize: size.width / 18),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Text(""),
                ),
                Text("", style: TextStyle(fontSize: size.width / 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
