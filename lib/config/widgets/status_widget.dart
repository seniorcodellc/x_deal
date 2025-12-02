import 'package:x_deal/exports.dart';

class StatusWidget extends StatelessWidget {
  final String text;
  final bool isActive;

  const StatusWidget({this.isActive = true, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(horizontal: 16.w,vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0.r),
        border: Border.all(color: isActive ? AppColors.primaryColor : AppColors.red, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSVGImage(
            asset: isActive ? AppAssets.check : AppAssets.pending,
            color: isActive ? AppColors.primaryColor : AppColors.red,
            height: 18.0.h,
            width: 18.0.w,
            matchTextDirection: false,
          ),
          8.hs,
          Text(
            text,
            style: getRegularTextStyle(fontSize: 15.sp, color: isActive ? AppColors.primaryColor : AppColors.red),
          ),
        ],
      ),
    );
  }
}
