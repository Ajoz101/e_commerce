import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.only(top: Get.width / 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: Get.width / 9,
                  ),
                  Text(
                    "Address",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Icon(
                    Icons.add_location_alt_outlined,
                    size: Get.width / 9,
                  )
                ],
              ),
            )
          
          
          ],
        ),
      ),
    );
  }
}
