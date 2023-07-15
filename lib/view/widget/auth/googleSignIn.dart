import 'package:e_commerce/controller/auth/google_signinController.dart';
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class GoogleSignInCard extends StatelessWidget {
  const GoogleSignInCard({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GoogleSignInController());
    return Container(
      margin: EdgeInsets.only(top: Get.width / 14),
      child: ActionChip(
        onPressed: () {
          controller.signInWithGoogle().then((_)=> controller.saveinfo()).then((_)=> Get.offAllNamed(AppRoutes.home));
        },
        label: Text("Sign In"),
        avatar: FaIcon(FontAwesomeIcons.google),
      ),
    );
  }
}
