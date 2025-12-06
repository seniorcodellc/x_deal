import 'package:x_deal/exports.dart';
class OnboardingDots extends StatelessWidget {
  const OnboardingDots({super.key, required this.currentPage});
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 28.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
            (index) => Container(
              margin: getMargin(horizontal: 3.0.w),
              width:  28.w,
              height: 6.w,
              decoration: ShapeDecoration(
                color: index == currentPage
                    ? AppColors.primaryColor
                    : AppColors.mutedPrimaryColor,
                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      )
                    ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
