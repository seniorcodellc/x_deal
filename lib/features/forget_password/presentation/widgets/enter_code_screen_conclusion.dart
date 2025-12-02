import '../../../../exports.dart';

class EnterCodeScreenConclusion extends StatelessWidget {
  const EnterCodeScreenConclusion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.checkCodeConclusion1.trans,
          style: getRegularTextStyle(
            color: AppColors.subTitleColor,
            fontSize: 14,
          ),
        ),
        Text(
          AppStrings.checkCodeConclusion2.trans,
          style: getRegularTextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
