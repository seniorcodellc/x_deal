import 'package:x_deal/core/widgets/custom_text_form_field.dart';

import '../../../../exports.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 221.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.secondaryColor, AppColors.primaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: getPadding(horizontal: 16.w),
        child: Padding(
          padding: getPadding(top: 50.h),
          child: Column(
            children: [
              Row(
                children: [
                  CustomSVGImage(asset: AppAssets.logoWhite),
                  8.hs,
                  Text(
                    AppStrings.appName.trans,
                    style: getBoldTextStyle(
                      fontSize: 20.sp,
                      color: AppColors.white,
                    ),
                  ),
                  161.hs,
                  CustomSVGImage(asset: AppAssets.like),
                  8.hs,
                  CustomSVGImage(asset: AppAssets.notification),
                ],
              ),
              16.vs,
              CustomTextFormField(
                height: 48.h,
                radiusOfContainer: 25.r,
                hintText: AppStrings.homeSearchHint,
                prefixIcon: CustomSVGImage(
                  asset: AppAssets.search,
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(221);
}
