import 'package:x_deal/core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/custom_password_text_field.dart';
import '../widgets/shared_email_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildWelcome(),
                  40.vs,
                  SharedEmailTextField(emailController: emailController, text: AppStrings.emailOrPhone.trans,),
                  16.vs,
                  CustomPasswordTextField(passwordController: passwordController, text: AppStrings.password.trans,),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: TextButton(
                      onPressed: () {
                        Routes.forgetPasswordRoute.moveTo();
                      },
                      child: Text(
                        AppStrings.forgetPasswordQuestionMark.trans,
                        style: getRegularTextStyle(color: AppColors.accentColor),
                      ),
                    ),
                  ),
                  40.vs,
                  Padding(
                    padding: getPadding(horizontal: 16.w),
                    child: CustomButton(
                      height: 60.0.h,
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: 25,
                      text: AppStrings.login.trans,
                      onPressed: () {
                        checkStringError(context, emailController.text, Errors.EMAIL_ERROR,);
                        checkStringError(context, passwordController.text, Errors.PASSWORD_ERROR,);
                        if (dontHaveErrors(context)) {
                          Routes.storeDetails.moveTo();
                        }
                      },
                    ),
                  ),
                  40.vs,
                  buildNoAccount(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNoAccount() {
    return GestureDetector(
      onTap: () {
        Routes.signUpByPhoneOrEmail.moveTo();
      },
      child: Center(
        child: RichText(
          text: TextSpan(
            style: getRegularTextStyle(fontSize: 15, color: AppColors.blackText),
            children: [
              TextSpan(text: AppStrings.dontHaveAccount.trans,),
              TextSpan(text: AppStrings.createAccount.trans, style: getRegularTextStyle(fontSize: 15, color: AppColors.primaryColor, decoration: TextDecoration.underline,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWelcome() {
    return Center(
      child: Column(
        children: [
          50.vs,
          CustomPngImage(image: AppAssets.logoText),
          14.vs,
          Text(
            AppStrings.logInWelcome.trans,
            style: getBoldTextStyle(fontSize: 22, color: AppColors.blackText),
          ),
          8.vs,
          Text(
            AppStrings.logInWelcomeSubtitle.trans,
            style: getRegularTextStyle(
              fontSize: 15,
              color: AppColors.blackText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
