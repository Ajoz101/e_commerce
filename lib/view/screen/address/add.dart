import 'package:e_commerce/view/widget/auth/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

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
                  Text(
                    "Add a new Address Now!",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            )

            // CustomFormField(textController: , validator: validator)
          ],
        ),
      ),
    );
  }
}
