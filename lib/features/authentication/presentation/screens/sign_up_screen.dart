import 'package:x_deal/core/widgets/custom_text_form_field.dart';

import '../../../../config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Padding(
        padding: getPadding(top: 40.61.h, horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomPngImage(image: AppAssets.logo),
                    8.vs,
                    Text(
                      AppStrings.createAccountInXDeal,
                      style: getBoldTextStyle(fontSize: 20),
                    ),
                    48.vs,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.fullName.trans,
                          style: getRegularTextStyle(fontSize: 16),
                        ),
                        16.vs,
                        CustomTextFormField(
                          controller: nameController,
                          hintText: AppStrings.fullNameHint.trans,
                        ),
                        BlocBuilder<ErrorCubit, CubitStates>(
                          builder: (context, state) => ErrorText(
                            showError: context
                                .read<ErrorCubit>()
                                .errors
                                .contains(Errors.NAME_ERROR),
                            text: getError[Errors.NAME_ERROR],
                          ),
                        ),
                        16.vs,
                        Text(
                          AppStrings.password.trans,
                          style: getRegularTextStyle(fontSize: 16),
                        ),
                        16.vs,
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: AppStrings.writeHere.trans,
                          isPassword: true,
                        ),
                        BlocBuilder<ErrorCubit, CubitStates>(
                          builder: (context, state) => ErrorText(
                            showError: context
                                .read<ErrorCubit>()
                                .errors
                                .contains(Errors.PASSWORD_ERROR),
                            text: getError[Errors.PASSWORD_ERROR],
                          ),
                        ),
                        16.vs,
                        Text(
                          AppStrings.confirmPassword.trans,
                          style: getRegularTextStyle(fontSize: 16),
                        ),
                        16.vs,
                        CustomTextFormField(
                          hintText: AppStrings.writeHere.trans,
                          controller: confirmPasswordController,
                          isPassword: true,
                        ),
                        BlocBuilder<ErrorCubit, CubitStates>(
                          builder: (context, state) => ErrorText(
                            showError: context
                                .read<ErrorCubit>()
                                .errors
                                .contains(Errors.MATCHING_PASSWORD_ERROR),
                            text: getError[Errors.MATCHING_PASSWORD_ERROR],
                          ),
                        ),
                        82.vs,
                        CustomButton(
                          text: AppStrings.createAccountButton.trans,
                          onPressed: () {
                            checkStringError(
                              context,
                              nameController.text,
                              Errors.NAME_ERROR,
                            );
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
