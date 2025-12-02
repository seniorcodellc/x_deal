
import '../../../../exports.dart';
import '../models/bottom_nav_bar_model.dart';

class BottomNavBarStatic {
  static List<BottomNavBarModel> screens = [
    BottomNavBarModel(
      asset: AppAssets.home,
      tabName: AppStrings.home,
      systemBarColor: AppColors.gradientColorStart,
    ),
    BottomNavBarModel(
      asset: AppAssets.loyalty,
      tabName: AppStrings.points,
      appBatTitle: AppStrings.pointsSummary,
    ),
    BottomNavBarModel(
      asset: AppAssets.logs,
      tabName: AppStrings.logs,
      appBatTitle: AppStrings.operationsLogs,
    ),
    BottomNavBarModel(
      asset: AppAssets.tabSettings,
      tabName: AppStrings.settings,
      appBatTitle: AppStrings.settings,
    ),
  ];
}
