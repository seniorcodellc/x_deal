import '../../../../exports.dart';

class SignUpTraderInstruction extends StatelessWidget {
  const SignUpTraderInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AppStrings.merchantInstruction1.trans,
              style: getRegularTextStyle(color: AppColors.subTitleColor),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            AppStrings.merchantInstruction2.trans,
            style: getRegularTextStyle(color: AppColors.subTitleColor),
          ),
        ],
      ),
    );
  }
}
