//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tech_blog/components/customized_appbar.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/constants/text_styles.dart';

class ArticlesListScreen extends StatelessWidget {
  const ArticlesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: customizedAppBar(size, Strings.listOfArticles),
    ));
  }
}
