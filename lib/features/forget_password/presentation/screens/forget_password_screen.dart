import 'package:x_deal/core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../exports.dart';
import '../../../authentication/presentation/widgets/shared_email_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.white,
      appBar: CustomAppbar(title: ''),
      showAppbar: true,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            24.vs,
            Text(
              AppStrings.forgetPassword.trans,
              style: getSemiBoldTextStyle(fontSize: 24, color: AppColors.primaryColor),
            ),
            20.vs,
            Text(
              AppStrings.pleaseEnterYourEmail1.trans,
              style: getRegularTextStyle(fontSize: 16, color: AppColors.gray),
            ),
            8.vs,
            Text(
              AppStrings.pleaseEnterYourEmail2.trans,
              style: getRegularTextStyle(fontSize: 16, color: AppColors.darkGray),
            ),
            32.vs,
           SharedEmailTextField(emailController: emailController, text: AppStrings.email.trans,),
            40.vs,
            Padding(
              padding: getPadding(horizontal: 16.0.w),
              child: CustomButton(
                text: AppStrings.resetPassword.trans,
                style: getRegularTextStyle(color: AppColors.white),
                borderRadius: 25,
                onPressed: () {
                  checkStringError(context, emailController.text, Errors.EMAIL_ERROR,);
                  if (dontHaveErrors(context)) {
                    Routes.enterCodeRoute.moveTo();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
