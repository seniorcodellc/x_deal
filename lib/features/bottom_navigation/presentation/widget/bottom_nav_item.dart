import 'package:x_deal/exports.dart';

import '../../data/models/bottom_nav_bar_model.dart';

class BottomNavItem extends StatelessWidget {
  final BottomNavBarModel bottomNavBarModel;
  final bool isSelected;
  final Function() onTap;
  const BottomNavItem({
    required this.bottomNavBarModel,
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: getPadding(horizontal: 10.w, top: 2.h),
        child: Column(
          children: [
            Expanded(
              child: CustomSVGImage(
                asset: bottomNavBarModel.asset,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.unselectedTab,
              ),
            ),
            Expanded(
              child: Text(
                bottomNavBarModel.tabName.trans,
                style: isSelected
                    ? getBoldTextStyle(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                      )
                    : getRegularTextStyle(
                        fontSize: 12,
                        color: AppColors.unselectedTab,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
