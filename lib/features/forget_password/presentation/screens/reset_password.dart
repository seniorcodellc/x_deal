import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/exports.dart';
import 'package:x_deal/features/authentication/presentation/widgets/shared_confirm_password_text_field.dart';
import 'package:x_deal/features/authentication/presentation/widgets/shared_password_text_field.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../authentication/presentation/widgets/custom_login_signup_textfield_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(title: ''),
      showAppbar: true,
      appBarBackgroundColor: AppColors.bgColor,
      child: Padding(
        padding: getPadding(horizontal: 16.h),
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.vs,
                    Text(
                      AppStrings.assignNewPassword.trans,
                      style: getSemiBoldTextStyle(
                        fontSize: 24,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    20.vs,
                    Text(
                      AppStrings.createNewPassword.trans,
                      style: getRegularTextStyle(color: AppColors.darkGray),
                    ),
                    32.vs,
                    CustomTitleAndField(
                      text: AppStrings.password.trans,
                      child: SharedPasswordTextField(
                        passwordController: passwordController,
                      ),
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.confirmPassword.trans,
                      child: SharedConfirmPasswordTextField(
                        confirmPasswordController: confirmPasswordController,
                      ),
                    ),
                    48.vs,
                    CustomButton(
                      text: AppStrings.save.trans,
                      style: getRegularTextStyle(color: AppColors.white),
                      onPressed: () {
                        checkStringError(
                          context,
                          passwordController.text,
                          Errors.PASSWORD_ERROR,
                        );
                        checkStringError(
                          context,
                          confirmPasswordController.text,
                          Errors.MATCHING_PASSWORD_ERROR,
                        );
                        if (dontHaveErrors(context)) {}
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
