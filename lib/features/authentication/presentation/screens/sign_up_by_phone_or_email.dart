import 'package:x_deal/core/widgets/custom_text_form_field.dart';
import 'package:x_deal/core/widgets/h_line.dart';

import '../../../../config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/shared_sign_up_toggle_option.dart';
import '../widgets/gift_pop_up.dart';

class SignUpByPhoneOrEmail extends StatefulWidget {
  const SignUpByPhoneOrEmail({super.key});

  @override
  State<SignUpByPhoneOrEmail> createState() => _SignUpByPhoneOrEmailState();
}

class _SignUpByPhoneOrEmailState extends State<SignUpByPhoneOrEmail> {
  bool isPhoneSelected = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Padding(
        padding: getPadding(top: 40.61.h, horizontal: 16.w),
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomPngImage(image: AppAssets.logoText),
                    16.vs,
                    Text(
                      AppStrings.headerWelcome,
                      style: getBoldTextStyle(fontSize: 24),
                    ),
                    40.vs,
                    Container(
                      width: 343.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color: AppColors.grayBg.withOpacity(0.10),

                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SharedSignUpToggleOption(
                            option: AppStrings.phoneNum,
                            onTap: () {
                              setState(() {
                                isPhoneSelected = true;
                              });
                            },
                            selected: isPhoneSelected,
                          ),
                          4.hs,
                          SharedSignUpToggleOption(
                            option: AppStrings.email,
                            onTap: () {
                              setState(() {
                                isPhoneSelected = false;
                              });
                            },
                            selected: !isPhoneSelected,
                          ),
                        ],
                      ),
                    ),
                    32.vs,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isPhoneSelected
                              ? AppStrings.phoneNum.trans
                              : AppStrings.email.trans,
                          style: getRegularTextStyle(fontSize: 16),
                        ),
                        16.vs,
                        isPhoneSelected
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextFormField(
                                    controller: phoneController,
                                    prefixIcon: Padding(
                                      padding: getPadding(start: 16.w),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomSVGImage(
                                            asset: AppAssets.egypt,
                                            fit: BoxFit.none,
                                          ),
                                          8.hs,
                                          Text(
                                            AppStrings.egCode,
                                            style: getRegularTextStyle(
                                              fontSize: 15,
                                              color: AppColors.blackText,
                                            ),
                                          ),
                                          3.hs,
                                          VLine(
                                            color: AppColors.grayBorder,
                                            thik: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    hintText:
                                        AppStrings.enterYourPhoneNumber.trans,
                                  ),
                                  BlocBuilder<ErrorCubit, CubitStates>(
                                    builder: (context, state) => ErrorText(
                                      showError: context
                                          .read<ErrorCubit>()
                                          .errors
                                          .contains(Errors.PHONE_ERROR),
                                      text: getError[Errors.PHONE_ERROR],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextFormField(
                                    controller: emailController,
                                    hintText: AppStrings.emailHint.trans,
                                  ),
                                  BlocBuilder<ErrorCubit, CubitStates>(
                                    builder: (context, state) => ErrorText(
                                      showError: context
                                          .read<ErrorCubit>()
                                          .errors
                                          .contains(Errors.EMAIL_ERROR),
                                      text: getError[Errors.EMAIL_ERROR],
                                    ),
                                  ),
                                ],
                              ),
                        24.vs,
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0.r),
                            ),
                            insetPadding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                            ),
                            child: GiftPopup(),
                          ),
                        );
                      },
                      child: Container(
                        width: 343.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.grayBorder),
                        ),
                        child: Padding(
                          padding: getPadding(horizontal: 16.w),
                          child: Row(
                            children: [
                              CustomPngImage(image: AppAssets.gift),
                              16.hs,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.areYouHaveCode,
                                    style: getRegularTextStyle(
                                      fontSize: 16,
                                      color: AppColors.blackText,
                                    ),
                                  ),
                                  Text(
                                    AppStrings.enterCode,
                                    style: getRegularTextStyle(
                                      fontSize: 16,
                                      color: AppColors.lightGray,
                                    ),
                                  ),
                                ],
                              ),
                              47.hs,
                              CustomSVGImage(asset: AppAssets.arrowLeft),
                            ],
                          ),
                        ),
                      ),
                    ),
                    24.vs,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.completeSignUpAccount,
                            style: getRegularTextStyle(),
                          ),
                          TextSpan(
                            text: AppStrings.termsAndConditions.trans,
                            style: getRegularTextStyle(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    40.vs,
                    CustomButton(
                      text: AppStrings.createAccountButton.trans,
                      onPressed: () {
                        checkStringError(
                          context,
                          isPhoneSelected
                              ? phoneController.text
                              : emailController.text,
                          isPhoneSelected
                              ? Errors.PHONE_ERROR
                              : Errors.EMAIL_ERROR,
                        );
                        if (dontHaveErrors(context)) {
                          Routes.otpRoute.moveTo();
                        }
                      },
                    ),
                    40.vs,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.haveAccount,
                            style: getRegularTextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: AppStrings.login.trans,
                            style: getRegularTextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
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
