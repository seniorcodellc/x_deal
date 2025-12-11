import 'package:x_deal/features/home/data/models/categories_famous_stores_model.dart';
import 'package:x_deal/exports.dart';

class CategoriesFamousStoresStatic {
  static List<CategoriesFamousStoresModel> categoriesList = [
    CategoriesFamousStoresModel(
      asset: AppAssets.restaurantCafe,
      text: AppStrings.restaurantCafe,
    ),
    CategoriesFamousStoresModel(
      asset: AppAssets.fashion,
      text: AppStrings.fashion,
    ),
    CategoriesFamousStoresModel(asset: AppAssets.games, text: AppStrings.games),
  ];
  static List<CategoriesFamousStoresModel> storesMostFamousList = [
    CategoriesFamousStoresModel(
      asset: AppAssets.defacto,
      text: AppStrings.defacto,
    ),
    CategoriesFamousStoresModel(
      asset: AppAssets.dejavu,
      text: AppStrings.dejavu,
    ),
    CategoriesFamousStoresModel(
      asset: AppAssets.dunkinDonuts,
      text: AppStrings.dunkinDonuts,
    ),
  ];
}
