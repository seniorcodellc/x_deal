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
      child: Column(
        children: [
          Expanded(
            child: CustomSVGImage(
              asset: isSelected
                  ? bottomNavBarModel.filledAsset
                  : bottomNavBarModel.asset,
              // color: isSelected ? AppColors.primaryColor : AppColors.black,
            ),
          ),
          Expanded(
            child: Text(
              bottomNavBarModel.tabName.trans,
              style: isSelected
                  ? getRegularTextStyle(fontSize: 14, color: AppColors.blue)
                  : getRegularTextStyle(fontSize: 14, color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
