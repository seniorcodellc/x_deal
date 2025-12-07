import '../../../../exports.dart';
import '../models/bottom_nav_bar_model.dart';

class BottomNavBarStatic {
  static List<BottomNavBarModel> screens = [
    BottomNavBarModel(
      asset: AppAssets.home,
      tabName: AppStrings.home,
      systemBarColor: AppColors.gradientColorStart,
      filledAsset: AppAssets.homeFilled,
    ),
    BottomNavBarModel(
      asset: AppAssets.shops,
      tabName: AppStrings.shops,
      appBatTitle: AppStrings.shops,
      filledAsset: AppAssets.shopsFilled,
    ),
    BottomNavBarModel(
      asset: AppAssets.wallet,
      tabName: AppStrings.wallet,
      appBatTitle: AppStrings.wallet,
      filledAsset: AppAssets.walletFilled,
    ),
    BottomNavBarModel(
      asset: AppAssets.settings,
      tabName: AppStrings.settings,
      appBatTitle: AppStrings.settings,
      filledAsset: AppAssets.settingsFilled,
    ),
  ];
}
