import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/features/authentication/presentation/managers/auth_cubit.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../exports.dart';
import '../../../authentication/presentation/widgets/custom_login_signup_textfield_text.dart';
import '../../../authentication/presentation/widgets/shared_email_text_field.dart';
import '../widgets/forget_password_screen_header.dart';
import '../widgets/shared_forget_password_title.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController emailController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.vs,
              SharedForgetPasswordTitle(),
              20.vs,
              ForgetPasswordScreenHeader(),
              32.vs,
              CustomTitleAndField(
                text: AppStrings.yourEmail.trans,
                child: SharedEmailTextField(emailController: emailController),
              ),
              40.vs,
              CustomButton(
                text: AppStrings.resetPassword.trans,
                style: getRegularTextStyle(color: AppColors.white),
                onPressed: () {
                  checkStringError(
                    context,
                    emailController.text,
                    Errors.EMAIL_ERROR,
                  );
                  if (dontHaveErrors(context)) {
                    context.read<AuthCubit>().forgetPassword(
                      email: emailController.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
