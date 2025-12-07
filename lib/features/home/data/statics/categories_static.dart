import 'package:x_deal/features/home/data/models/categories_model.dart';
import 'package:x_deal/exports.dart';

class CategoriesStatic {
  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      asset: AppAssets.restaurantCafe,
      text: AppStrings.restaurantCafe,
    ),
    CategoriesModel(asset: AppAssets.fashion, text: AppStrings.fashion),
    CategoriesModel(asset: AppAssets.games, text: AppStrings.games),
  ];
}
