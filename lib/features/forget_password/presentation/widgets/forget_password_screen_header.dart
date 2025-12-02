import 'package:x_deal/exports.dart';

class ForgetPasswordScreenHeader extends StatelessWidget {
  const ForgetPasswordScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.pleaseEnterYourEmail1.trans,
          style: getRegularTextStyle(fontSize: 16, color: AppColors.darkGray),
        ),
        8.vs,
        Text(
          AppStrings.pleaseEnterYourEmail2.trans,
          style: getRegularTextStyle(fontSize: 16, color: AppColors.darkGray),
        ),
      ],
    );
  }
}
