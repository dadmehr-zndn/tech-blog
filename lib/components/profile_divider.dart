import 'package:flutter/material.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: size.width / 4.65,
      endIndent: size.width / 4.65,
    );
  }
}
