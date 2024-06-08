import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/constants/colors.dart';

// ignore: must_be_immutable
class LoadingSpinKit extends StatelessWidget {
  LoadingSpinKit({
    super.key,
    this.size,
  });

  double? size;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: size ?? 16,
    );
  }
}
