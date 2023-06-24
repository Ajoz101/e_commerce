import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/obsecureText.dart';
import '../../../core/constant/colors.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key,
      this.title,
      this.hintText,
      this.icon,
      required this.textController,
      required this.validator,
      this.obscureText});
  String? title;
  String? hintText;
  IconData? icon;
  bool? obscureText;
  TextEditingController? textController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var controller = Get.put(ObsecureController());
    return Container(
      margin: EdgeInsets.only(bottom: height / 30),
      child: GetBuilder<ObsecureController>(builder: (controller) {
        return TextFormField(
          obscureText: obscureText != null ? controller.isSeen == false : false,
          validator: validator,
          controller: textController,
          decoration: InputDecoration(
            prefixIcon: GetBuilder<ObsecureController>(
              builder: ((controller) => obscureText == true
                  ? IconButton(
                      color: controller.isSeen == true
                          ? AppColor.primary
                          : AppColor.second,
                      onPressed: () {
                        controller.onClicked();
                      },
                      icon: controller.isSeen == false
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    )
                  : SizedBox()),
            ),
            hintStyle: const TextStyle(fontSize: 14),
            hintText: hintText,
            suffixIcon: Icon(icon, color: AppColor.primary),
            focusColor: AppColor.second,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
              title!,
              style: const TextStyle(fontSize: 20, color: AppColor.grey),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      }),
    );
  }
}
