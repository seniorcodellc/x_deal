import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/features/forget_password/presentation/widgets/custom_success_widget.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../exports.dart';

class SuccessPassword extends StatelessWidget {
  const SuccessPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(title: ''),
      showAppbar: true,
      backgroundColor: AppColors.scaffoldBgColor,
        child: CustomSuccessWidget(title: AppStrings.passwordResetSuccessTitle.trans,
          subTitle:AppStrings.passwordResetSuccessSubtitle.trans,)
    );
  }
}
