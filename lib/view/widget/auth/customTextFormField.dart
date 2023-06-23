import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key, this.title, this.hintText, this.icon, required this.textController});
  String? title;
  String? hintText;
  IconData? icon;
  TextEditingController? textController;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: height / 30),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
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
      ),
    );
  }
}
