import 'package:carousel_slider/carousel_slider.dart';
import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/features/home/data/statics/categories_static.dart';
import 'package:x_deal/features/home/data/statics/rewards_static.dart';
import 'package:x_deal/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:x_deal/features/home/presentation/widgets/shared_home_header_code.dart';

import '../../../../core/widgets/h_line.dart';
import '../../../../exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.secondaryColor,
      showNavBar: true,
      showAppbar: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [CustomHomeAppBar(), buildHomeHeader()]),
          24.vs,
          buildRewards(),
          16.vs,
          24.vs,
          Padding(
            padding: getPadding(horizontal: 16.w),
            child: Text(
              AppStrings.categories.trans,
              style: getBoldTextStyle(fontSize: 16),
            ),
          ),
          8.vs,
          buildCategories(),
          24.vs,
        ],
      ),
    );
  }

  Widget buildHomeHeader() {
    return Padding(
      padding: getPadding(top: 160.h, start: 15.w),
      child: Container(
        width: 343.w,
        height: 106.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppColors.black.withOpacity(0.10)),
        ),
        child: Padding(
          padding: getPadding(vertical: 24.h, horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SharedHomeHeaderCode(
                asset: AppAssets.scanFilled,
                text: AppStrings.yourPrivateCode,
              ),
              VLine(thik: 0.2, height: 63, color: AppColors.gray),
              SharedHomeHeaderCode(
                asset: AppAssets.shareCode,
                text: AppStrings.shareCode,
              ),
              VLine(thik: 0.2, height: 63, color: AppColors.gray),
              SharedHomeHeaderCode(
                asset: AppAssets.coin,
                text: AppStrings.xCoin,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRewards() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 139.h,
        enlargeCenterPage: true,
        autoPlay: true,
        viewportFraction: 0.75,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: List.generate(RewardsStatic.rewardsItems.length, (index) {
        final model = RewardsStatic.rewardsItems[index];
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: CustomPngImage(image: model.asset),
        );
      }),
    );
  }

  Widget buildCategories() {
    return Expanded(
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: getPadding(horizontal: 16.w),
              child: Row(
                children: List.generate(
                  CategoriesStatic.categoriesList.length,
                  (index) {
                    final model = CategoriesStatic.categoriesList[index];
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Padding(
                        padding: getPadding(start: 2.w, end: 10.w),
                        child: Container(
                          width: 104.w,
                          height: 129.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.black.withOpacity(0.5),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomPngImage(image: model.asset),
                              8.vs,
                              Text(
                                model.text,
                                style: getRegularTextStyle(
                                  fontSize: 14,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
