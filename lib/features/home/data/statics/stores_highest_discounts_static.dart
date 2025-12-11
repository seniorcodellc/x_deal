import 'package:x_deal/exports.dart';

import '../models/stores_highest_discounts_model.dart';

class StoresHighestDiscountsStatic {
  static List<StoresHighestDiscountsModel> storesHighestDiscountsList = [
    StoresHighestDiscountsModel(
      storeDiscount: AppStrings.rate,
      storeImage: AppAssets.cilantroSale,
      storeLogo: AppAssets.cilantroLogo,
      storeName: AppStrings.cilantroCaffe,
    ),
    StoresHighestDiscountsModel(
      storeDiscount: AppStrings.rate,
      storeImage: AppAssets.buffaloSale,
      storeLogo: AppAssets.buffaloLogo,
      storeName: AppStrings.buffaloBurger,
    ),
  ];
}
