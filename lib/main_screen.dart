//todo: uncomment
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          // AppBar
          Padding(
            padding: EdgeInsets.fromLTRB(12.53, 30.6, 12.53, 29.28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Assets.images.logo.image(height: size.height / 13.63),
                Transform.scale(scaleX: -1, child: Icon(Icons.search)),
              ],
            ),
          ),

          // Poster
          Stack(
            children: [
              // Image
              Container(
                height: size.height / 4.20,
                width: size.width / 1.19,
                decoration: BoxDecoration(
                  //todo: check for the exact radius
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.posterTest.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Gradient Overlay
              Container(
                height: size.height / 4.20,
                width: size.width / 1.19,
                decoration: BoxDecoration(
                  //todo: check for the exact radius
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: GradientColors.homePosterOverlay,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.7, 1],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
