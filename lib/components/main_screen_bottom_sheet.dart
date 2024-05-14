import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/themes/text_styles.dart';

class MainScreenBottomSheet extends StatelessWidget {
  const MainScreenBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3.27,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 15.08, vertical: Get.height / 27.64),
        child: Column(
          children: [
            // TITLE
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.techBot.svg(height: Get.height / 15),
                SizedBox(width: Get.width / 20.15),
                Text(
                  Strings.shareYourKnowledgeWithOthers,
                  style: Get.textTheme.headline4,
                ),
              ],
            ),

            SizedBox(height: Get.height / 39.88),

            // BODY
            Text(
              Strings.thinkBeingHereMeans,
              style: mainScreenBottomSheetTextStyle,
            ),

            SizedBox(height: Get.height / 20),

            // BUTTONS, manage articles & podcasts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // manage articles button
                InkWell(
                  splashColor: SolidColors.clickSplashColor,
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Assets.icons.manageArticles
                          .image(height: Get.height / 32),
                      SizedBox(width: Get.width / 25),
                      Text(
                        Strings.manageArticles,
                        style: mainScreenButtonsTextStyle,
                      ),
                    ],
                  ),
                ),

                // manage podcasts button
                InkWell(
                  splashColor: SolidColors.clickSplashColor,
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {},
                  child: Row(
                    children: [
                      Assets.icons.managePodcasts
                          .image(height: Get.height / 32),
                      SizedBox(width: Get.width / 25),
                      Text(
                        Strings.managePodcasts,
                        style: mainScreenButtonsTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
