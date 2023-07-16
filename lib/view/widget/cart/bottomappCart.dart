import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import 'coupon_button.dart';
import 'orderbutton.dart';

class BottomAppCart extends StatelessWidget {
  BottomAppCart({super.key, this.total, this.coupon, this.addCoupon,this.discount});
  String? total;
  String? discount;
  final TextEditingController? coupon;
  void Function()? addCoupon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 15),
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 15),
                            child: Text(
                              textAlign: TextAlign.center,
                              "$total \$",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  color: AppColor.white,
                                  fontFamily: "sans"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 15),
                            child: Text(
                              "Discount",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 15),
                            child: Text(
                              textAlign: TextAlign.center,
                              "$discount",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  color: AppColor.white,
                                  fontFamily: "sans"),
                            ),
                          ),
                        ],
                      ),
          CutomOrderButton(
            title: "Order",
            onPressed: () {
              Get.bottomSheet(
                enterBottomSheetDuration: Duration(milliseconds: 600),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: AppColor.secondLight),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: Get.width / 4),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "Just Add a Discount Coupon",
                                    content: TextFormField(
                                      controller: coupon,
                                      decoration: InputDecoration(
                                        hintText: "Add Coupon",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      ActionChip(
                                        label: const Text("Save"),
                                        avatar:const Icon(
                                          Icons.save_alt_rounded,
                                          color: AppColor.primary,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  );
                                },
                                child: TextFormField(
                                  enabled: false,
                                  controller: coupon,
                                  decoration: InputDecoration(
                                    hintText: "Add Coupon",
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child:
                                    CustomCouponButton(onPressed: addCoupon)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 15),
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 15),
                            child: Text(
                              textAlign: TextAlign.center,
                              "$total \$",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  color: AppColor.white,
                                  fontFamily: "sans"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 15),
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                           Container(
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 15),
                            child: Text(
                              textAlign: TextAlign.center,
                              "$discount",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  color: AppColor.white,
                                  fontFamily: "sans"),
                            ),
                          ),
                        ],
                      ),
                      CutomOrderButton(
                        onPressed: () {},
                        title: "Confirm",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
