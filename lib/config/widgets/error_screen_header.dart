import '../../../../exports.dart';

class ErrorScreenHeader extends StatelessWidget {
  final String message;
  const ErrorScreenHeader({required this.message,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 177.82.w,
          height: 177.82.h,
          decoration: BoxDecoration(
            color: AppColors.mutedBlue,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: CustomSVGImage(asset: AppAssets.errorAlarm, fit: BoxFit.none),
        ),
        14.vs,
        Text(
          message,
          style: getRegularTextStyle(
            fontSize: 15.sp,
            color: AppColors.errorHeader,
          ),
        ),

      ],
    );
  }
}
