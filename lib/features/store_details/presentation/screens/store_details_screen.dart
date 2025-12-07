import 'package:x_deal/exports.dart';
import '../widgets/about_place_tab.dart';
import '../widgets/reviews_tab.dart';
import '../widgets/store_details_app_bar.dart';
import '../widgets/terms_tab.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      appBar: StoreDetailsAppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppAssets.cilantroDetails,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 350.0.h,
                ),
                Padding(
                  padding: getPadding(top: 240.0.h),
                  child: buildDots(),
                ),
                Padding(
                  padding: getPadding(top: 265.0.h),
                  child: buildDetails(),
                ),
                Padding(
                  padding: getPadding(top: 265.0.h, start: 255.w),
                  child: CustomSVGImage(asset: AppAssets.saleBox),
                ),
                Padding(
                  padding: getPadding(top: 280.0.h, start: 265.w),
                  child: Text(
                    '% 30',
                    style: getRegularTextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(52.0.r),
          topLeft: Radius.circular(52.0.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: getPadding(all: 16.0.w),
            child: buildHeader(),
          ),
          14.vs,
          _buildToggleTabs(),
          16.vs,
          _buildToggleBody(),
        ],
      ),
    );
  }
  Widget buildHeader() {
    return Row(
      children: [
        SizedBox(
            height: 58.h,
            width: 58.w,
            child: CustomPngImage(image: AppAssets.cilantroLogo)),
        8.hs,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'سلينترو كافيه',
              style: getRegularTextStyle(fontSize: 22),
            ),
            8.vs,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      size: 22,
                      color: AppColors.yellow,
                    ),
                    separatorBuilder: (context, index) => 2.hs,
                  ),
                ),
                10.hs,
                Text('(4.5)',
                    style: getRegularTextStyle(
                        fontSize: 14.sp, color: AppColors.gray)),
              ],
            ),
            8.vs,
            Row(
              children: [
                _buildTag('قهوة'),
                4.hs,
                _buildTag('حلويات'),
              ],
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildTag(String text) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mutedPrimaryColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: getPadding(horizontal: 14.0.w, vertical: 5.h),
        child: Text(text, style: getRegularTextStyle(fontSize: 12)),
      ),
    );
  }
  Widget _buildToggleTabs() {
    return Container(
      padding: getPadding(horizontal: 40.w, top: 18.h, bottom: 10.0.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.iconColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildToggleItem('عن المكان', 0),
          16.hs,
          buildToggleItem('شروط الاستخدام', 1),
          16.hs,   // << spacing
          buildToggleItem('آراء العملاء', 2),
        ],
      ),
    );
  }
  Widget buildToggleItem(String text, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Text(
          text,
          style: isSelected
              ? getSemiBoldTextStyle(fontSize: 13, color: AppColors.primaryColor)
              : getRegularTextStyle(fontSize: 13, color: AppColors.gray),
        ),
      ),
    );
  }
  Widget _buildToggleBody() {
    switch (selectedIndex) {
      case 0:
        return const AboutPlaceTab();
      case 1:
        return const TermsTab();
      case 2:
        return const ReviewsTab();
      default:
        return const SizedBox();
    }
  }
  Widget buildDots() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(6, (index) {
          return Container(
            width: 10.w,
            height: 10.h,
            margin: getMargin(horizontal: 4.w),
            decoration: BoxDecoration(
              color: index == 0
                  ? AppColors.primaryColor
                  : AppColors.dotsColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
          );
        }),
      ),
    );
  }
}
