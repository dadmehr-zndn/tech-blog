import 'package:flutter/material.dart';
import 'package:tech_blog/constants.dart';

class ProfileTextButton extends StatelessWidget {
  const ProfileTextButton({
    super.key,
    required this.size,
    required this.textTheme,
    required this.title,
  });

  final Size size;
  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: SolidColors.primaryColor.withOpacity(0.1),
      onTap: () {
        //TODO: implement
      },
      child: SizedBox(
        height: size.height / 15.97,
        width: size.width / 1.75,
        child: Center(
          child: Text(
            title,
            style: textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
