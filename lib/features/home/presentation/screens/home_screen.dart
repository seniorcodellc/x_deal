import 'package:carousel_slider/carousel_slider.dart';
import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/features/home/data/statics/categories_famous_stores_static.dart';
import 'package:x_deal/features/home/data/statics/rewards_static.dart';
import 'package:x_deal/features/home/data/statics/services_static.dart';
import 'package:x_deal/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:x_deal/features/home/presentation/widgets/shared_titles.dart';
import '../../../../exports.dart';
import '../../data/statics/stores_highest_discounts_static.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.secondaryColor,
      showNavBar: true,
      showAppbar: true,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [CustomHomeAppBar(), buildHomeHeader()]),
                34.vs,
                buildRewards(),
                16.vs,
                buildDots(),
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
                SharedTitles(title: AppStrings.storesHighestDiscounts),
                8.vs,
                buildStoresHighestDiscounts(),
                24.vs,
                SharedTitles(title: AppStrings.storesMostFamous),
                8.vs,
                buildStoresMostFamous(),
                20.vs,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHomeHeader() {
    return Padding(
      padding: getPadding(top: 140.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(ServicesStatic.servicesList.length, (index) {
          final model = ServicesStatic.servicesList[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: Container(
              width: 104.w,
              height: 81.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4.r,
                    color: AppColors.primaryColor.withOpacity(0.25),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.r),
                color: AppColors.white,
                border: Border.all(color: AppColors.black.withOpacity(0.10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSVGImage(asset: model.serviceAsset),
                  8.vs,
                  Text(
                    model.serviceTitle,
                    style: getRegularTextStyle(
                      fontSize: 14,
                      color: AppColors.blackText,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
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

        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      items: List.generate(RewardsStatic.rewardsList.length, (index) {
        final model = RewardsStatic.rewardsList[index];
        return CustomPngImage(image: model.asset);
      }),
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        RewardsStatic.rewardsList.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: currentIndex == index ? 10.w : 10.w,
          height: currentIndex == index ? 10.w : 10.w,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.black
                : AppColors.dotsColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget buildCategories() {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          CategoriesFamousStoresStatic.categoriesList.length,
          (index) {
            final model = CategoriesFamousStoresStatic.categoriesList[index];
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                width: 104.w,
                height: 129.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.black.withOpacity(0.10)),
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
            );
          },
        ),
      ),
    );
  }

  Widget buildStoresHighestDiscounts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: getPadding(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            StoresHighestDiscountsStatic.storesHighestDiscountsList.length,
            (index) {
              final model = StoresHighestDiscountsStatic
                  .storesHighestDiscountsList[index];
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: Padding(
                  padding: getPadding(end: 6.w),
                  child: Container(
                    width: 219.w,
                    height: 163.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 219.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.r),
                              topRight: Radius.circular(25.r),
                            ),
                            image: DecorationImage(
                              image: AssetImage(model.storeImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        16.vs,
                        Padding(
                          padding: getPadding(horizontal: 16.w),
                          child: Row(
                            children: [
                              CustomPngImage(image: model.storeLogo),
                              16.hs,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.storeName,
                                    style: getRegularTextStyle(
                                      fontSize: 16,
                                      color: AppColors.blackText,
                                    ),
                                  ),
                                  Text(
                                    model.storeDiscount,
                                    style: getRegularTextStyle(
                                      fontSize: 16,
                                      color: AppColors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
    );
  }

  Widget buildStoresMostFamous() {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          CategoriesFamousStoresStatic.storesMostFamousList.length,
          (index) {
            final model =
                CategoriesFamousStoresStatic.storesMostFamousList[index];
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                width: 104.w,
                height: 103.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.black.withOpacity(0.10)),
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
            );
          },
        ),
      ),
    );
  }
}
