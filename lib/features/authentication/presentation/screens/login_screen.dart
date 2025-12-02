import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/features/authentication/data/model/request_model/login_model.dart';
import 'package:x_deal/features/authentication/presentation/managers/auth_cubit.dart';
import 'package:x_deal/features/authentication/presentation/widgets/custom_login_signup_textfield_text.dart';
import 'package:x_deal/features/authentication/presentation/widgets/login_password_text_field.dart';
import '../../../../exports.dart';
import '../widgets/log_in_have_no_account_row.dart';
import '../widgets/log_in_welcome_body.dart';
import '../widgets/shared_email_text_field.dart';
import '../widgets/shared_password_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  79.vs,
                  LogInWelcomeBody(),
                  32.vs,
                  Padding(
                    padding: getPadding(horizontal: 16.w),
                    child: CustomTitleAndField(
                      text: AppStrings.email.trans,
                      child: SharedEmailTextField(
                        emailController: emailController,
                      ),
                    ),
                  ),
                  16.vs,
                  Padding(
                    padding: getPadding(horizontal: 16.w),
                    child: CustomTitleAndField(
                      text: AppStrings.password.trans,
                      child: LoginPasswordTextField(
                        passwordController: passwordController,
                      ),
                    ),
                  ),
                  20.vs,
                  Padding(
                    padding: getPadding(horizontal: 16.w),
                    child: CustomButton(
                      text: AppStrings.login.trans,
                      onPressed: () {
                        checkStringError(
                          context,
                          emailController.text,
                          Errors.EMAIL_ERROR,
                        );
                        checkStringError(
                          context,
                          passwordController.text,
                          Errors.PASSWORD_ERROR,
                        );
                        if (dontHaveErrors(context)) {
                          print("start api request");
                          context.read<AuthCubit>().login(
                            LoginModel(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                        if (_formKey.currentState!.validate().isTrue) {}
                      },
                    ),
                  ),
                  42.vs,
                  LogInHaveNoAccountRow(),
                  32.vs,
                  Padding(
                    padding: getPadding(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              Routes.registerTraderRoute.moveTo();
                            },
                            text: AppStrings.signUpAsMerchant.trans,
                          ),
                        ),
                        12.hs,
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              Routes.registerTechRoute.moveTo();
                            },
                            text: AppStrings.signUpAsTech.trans,
                          ),
                        ),
                      ],
                    ),
                  ),
                  55.vs,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}