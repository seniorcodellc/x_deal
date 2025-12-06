import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/exports.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../authentication/presentation/widgets/custom_password_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(title: ''),
      showAppbar: true,
      backgroundColor: AppColors.white,
      child: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: getRegularTextStyle(color: AppColors.gray),
                  ),
                  32.vs,
                  CustomPasswordTextField(passwordController: passwordController, text:AppStrings.password.trans,),
                  16.vs,
                  CustomPasswordTextField(passwordController: confirmPasswordController, text: AppStrings.confirmNewPassword.trans,),
                  48.vs,
                  Padding(
                    padding: getPadding(horizontal: 16.0.w),
                    child: CustomButton(
                      text: AppStrings.save.trans,
                      height: 60.0.h,
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: 25,
                      onPressed: () {
                        checkStringError(context, passwordController.text, Errors.PASSWORD_ERROR,);
                        checkStringError(context, confirmPasswordController.text, Errors.MATCHING_PASSWORD_ERROR,);
                        if (dontHaveErrors(context)) {Routes.successPassword.moveTo();}
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
