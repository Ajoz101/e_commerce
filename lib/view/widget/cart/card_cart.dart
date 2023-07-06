import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/image_asset.dart';

class CustomCartCard extends StatelessWidget {
  CustomCartCard({super.key, this.name, this.price, this.quantity});
  String? name;
  String? price;
  String? quantity;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                  imageUrl: ImageAsset.logo, fit: BoxFit.fitHeight, height: 90),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Text(
                  "\$ $price",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColor.primary, fontFamily: "sans"),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 36,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconic.plus, color: AppColor.primary),
                    ),
                  ),
                  Text(
                    quantity!,
                    style: TextStyle(fontFamily: "sans", fontSize: 20),
                  ),
                  SizedBox(
                    height: 35,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconic.minus,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
