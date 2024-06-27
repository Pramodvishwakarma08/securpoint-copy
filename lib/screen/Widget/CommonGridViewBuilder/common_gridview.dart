import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../../model/assets_model.dart';
import '../../asset_details/assets_details_screen.dart';
import '../asset_card/custom_card_for_user_assets.dart';

class GridViewBuilderCommonAssetCard extends StatelessWidget {
  final List<Asset> assets;
  const GridViewBuilderCommonAssetCard({super.key, required this.assets});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: assets.length ?? 0,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 262.ah,
            mainAxisSpacing: 21.ah,
            crossAxisSpacing: 24.aw),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => AssetDetailsScreen(assetDetailsModel: assets[index]));
            },
            child: CustomCardForUserAsset(
              index: index,
              AssetObj: assets[index],
            ),
          );
        });
  }
}
