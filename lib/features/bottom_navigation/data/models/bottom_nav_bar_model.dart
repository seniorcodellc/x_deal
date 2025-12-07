import '../../../../exports.dart';

class BottomNavBarModel {
  final String asset;
  final String filledAsset;
  final String tabName;
  final String? appBatTitle;
  final Color? systemBarColor;
  BottomNavBarModel({
    required this.filledAsset,
    required this.asset,
    required this.tabName,
    this.appBatTitle,
    this.systemBarColor,
  });
}
