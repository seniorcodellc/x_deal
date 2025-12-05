import '../../../../exports.dart';

class SharedSignUpToggleOption extends StatelessWidget {
  const SharedSignUpToggleOption({
    super.key,
    required this.option,
    required this.onTap,
    required this.selected,
  });
  final String option;
  final Function() onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 42.h,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.white
              : AppColors.grayBg.withOpacity(0.10),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(option.trans, style: getRegularTextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
