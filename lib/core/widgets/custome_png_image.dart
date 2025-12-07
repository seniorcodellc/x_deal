// ignore_for_file: must_be_immutable

import '../../exports.dart';

class CustomPngImage extends StatelessWidget {
  CustomPngImage({
    super.key,
    required this.image,
    this.alignment = Alignment.center,
    this.color,

    // this.width,
    // this.height,
  });

  final String image;
  final Color? color;

  // double? width;
  // double? height;
  Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return image.contains('http')
        ? Image(
            alignment: alignment,
            // width: width,
            // height: height,
            fit: BoxFit.fill,
            color: color ?? AppColors.transparent,
            image: NetworkImage(image),
          )
        : Image(fit: BoxFit.fill, image: AssetImage(image));
  }
}
