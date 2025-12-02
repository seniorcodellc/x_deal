import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/features/change_password/data/models/request_model/change_password_request_model.dart';
import 'package:x_deal/features/authentication/presentation/managers/auth_cubit.dart';
import 'package:x_deal/features/authentication/presentation/widgets/shared_confirm_password_text_field.dart';
import 'package:x_deal/features/authentication/presentation/widgets/shared_password_text_field.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../exports.dart';
import '../../../authentication/presentation/widgets/custom_login_signup_textfield_text.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      showAppbar: true,
      appBar: CustomAppbar(title: AppStrings.changePassword.trans),
      child: Padding(
        padding: getPadding(horizontal: 16.w, top: 20.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTitleAndField(
                      text: AppStrings.oldPassword.trans,
                      child: SharedPasswordTextField(
                        passwordController: oldPasswordController,
                      ),
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.newPassword.trans,
                      child: SharedPasswordTextField(
                        passwordController: newPasswordController,
                      ),
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.confirmPassword.trans,
                      child: SharedConfirmPasswordTextField(
                        confirmPasswordController: confirmPasswordController,
                      ),
                    ),
                    32.vs,
                    CustomButton(
                      text: AppStrings.save.trans,
                      onPressed: () {
                        print("donia");
                        checkStringError(
                          context,
                          oldPasswordController.text,
                          Errors.PASSWORD_ERROR,
                        );
                        checkStringError(
                          context,
                          newPasswordController.text,
                          Errors.PASSWORD_ERROR,
                        );
                        checkStringError(
                          context,
                          confirmPasswordController.text,
                          Errors.MATCHING_PASSWORD_ERROR,
                        );
                        if (dontHaveErrors(context)) {
                          context.read<AuthCubit>().changePassword(
                            ChangePasswordRequestModel(
                              password: oldPasswordController.text,
                              newPassword: newPasswordController.text,
                              confirmPassword: confirmPasswordController.text,
                            ),
                          );
                        }
                        if (_formKey.currentState!.validate().isTrue) {}
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
