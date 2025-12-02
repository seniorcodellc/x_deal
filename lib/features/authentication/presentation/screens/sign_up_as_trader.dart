import 'package:x_deal/exports.dart';
import 'package:x_deal/features/authentication/data/model/request_model/register_merchant_model.dart';
import 'package:x_deal/features/authentication/presentation/managers/auth_cubit.dart';
import 'package:x_deal/features/authentication/presentation/widgets/company_name_field.dart';
import 'package:x_deal/features/authentication/presentation/widgets/shared_confirm_password_text_field.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../widgets/custom_login_signup_textfield_text.dart';
import '../widgets/government_and_regions_drop_down.dart';
import '../widgets/shared_email_text_field.dart';
import '../widgets/shared_enter_name_text_field.dart';
import '../widgets/shared_password_text_field.dart';
import '../widgets/shared_phone_text_field.dart';
import '../widgets/sign_up_trader_instruction.dart';

class SignUpAsTrader extends StatelessWidget {
  SignUpAsTrader({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  int? governorateId;
  int? regionId;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      showAppbar: true,
      appBar: CustomAppbar(title: AppStrings.signUpAsNewMerchant.trans),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: getPadding(horizontal: 16, vertical: 32),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleAndField(
                      text: AppStrings.fullName.trans,
                      child: SharedEnterNameTextField(
                        nameController: nameController,
                      ),
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.phoneNum.trans,
                      child: SharedPhoneTextField(
                        phoneController: phoneController,
                      ),
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.companyName.trans,
                      child: CompanyNameField(
                        companyNameController: companyNameController,
                      ),
                    ),

                    16.vs,
                    GovernmentAndRegionsDropDown(
                      onGovernmentAndCitySelected: (governmentId, cityId) {
                        print("gooo ${governmentId}");
                        print("city ${cityId}");
                        this.governorateId = governmentId;
                        this.regionId = cityId;
                      },
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.email.trans,
                      child: SharedEmailTextField(
                        emailController: emailController,
                      ),
                    ),
                    16.vs,
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

                    40.vs,
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
                          companyNameController.text,
                          Errors.NAME_ERROR,
                        );
                        checkStringError(
                          context,
                          emailController.text,
                          Errors.EMAIL_ERROR,
                        );
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
                        checkStringError(
                          context,
                          phoneController.text,
                          Errors.PHONE_ERROR,
                        );
                        checkNullError(
                          context,
                          governorateId,
                          Errors.GOVERNORATE_ERROR,
                        );
                        checkNullError(context, regionId, Errors.CITY_ERROR);
                        checkBoolError(
                          context,
                          confirmPasswordController.text.isEqualTo(
                            passwordController.text,
                          ),
                          Errors.MATCHING_PASSWORD_ERROR,
                        );

                        if (dontHaveErrors(context)) {
                          print("start api request");
                          if (_formKey.currentState!.validate().isTrue) {
                            context.read<AuthCubit>().registerMerchant(
                              RegisterMerchantModel(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                                passwordConfirmation:
                                    confirmPasswordController.text,
                                governorateId: governorateId,
                                regionId: regionId,
                              ),
                            );
                          }
                        }
                      },
                    ),
                    24.vs,
                    SignUpTraderInstruction(),
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
