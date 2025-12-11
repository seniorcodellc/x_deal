import '../models/services_model.dart';
import 'package:x_deal/exports.dart';

class ServicesStatic {
  static List<ServicesModel> servicesList = [
    ServicesModel(
      serviceAsset: AppAssets.scanFilled,
      serviceTitle: AppStrings.yourPrivateCode,
    ),
    ServicesModel(
      serviceAsset: AppAssets.shareCode,
      serviceTitle: AppStrings.shareCode,
    ),
    ServicesModel(serviceAsset: AppAssets.coin, serviceTitle: AppStrings.xCoin),
  ];
}
