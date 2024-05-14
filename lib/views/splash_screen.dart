// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () => Get.offNamed(Routes.main),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.logo.image(height: size.height / 10),
            SizedBox(height: size.height / 30),
            SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: size.width / 16,
            ),
          ],
        ),
      ),
    );
  }
}
