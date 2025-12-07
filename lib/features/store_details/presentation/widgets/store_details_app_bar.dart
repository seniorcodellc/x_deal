import 'package:x_deal/exports.dart';
class StoreDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const StoreDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: getPadding(vertical: 8.0.h, horizontal: 18.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){ pop();},
                child: CustomSVGImage(asset: AppAssets.backArrow)),
            Row(
              children: [
                CustomSVGImage(asset: AppAssets.shareCircle),
               8.hs,
                CustomSVGImage(asset: AppAssets.favorite),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0.h);
}