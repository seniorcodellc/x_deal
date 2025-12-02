import 'package:x_deal/core/profile/presentation/manager/profile_cubit.dart';
import 'package:x_deal/core/widgets/custom_appbar.dart';
import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/features/authentication/presentation/widgets/custom_login_signup_textfield_text.dart';
import 'package:x_deal/features/edit_profile/data/models/edit_profile_request_model.dart';
import 'package:x_deal/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../exports.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      showAppbar: true,
      appBar: CustomAppbar(title: AppStrings.editProfile.trans),
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
                      text: AppStrings.email.trans,
                      child: CustomTextFormField(
                        controller: emailController,
                        hintText: context.read<ProfileCubit>().model?.email.validate,
                        prefixIcon: CustomSVGImage(
                          asset: AppAssets.email,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.phoneNum.trans,
                      child: CustomTextFormField(
                        hintText: context.read<ProfileCubit>().model?.phone.validate,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        prefixIcon: CustomSVGImage(
                          asset: AppAssets.phone,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.fullName.trans,
                      child: CustomTextFormField(
                        hintText: context.read<ProfileCubit>().model?.name.validate,
                        prefixIcon: CustomSVGImage(
                          asset: AppAssets.profile,
                          fit: BoxFit.none,
                        ),
                        controller: nameController,
                      ),
                    ),
                    16.vs,
                    CustomTitleAndField(
                      text: AppStrings.companyName.trans,
                      child: CustomTextFormField(
                        controller: companyNameController,
                        hintText: context.read<ProfileCubit>().model?.name.validate,
                        prefixIcon: CustomSVGImage(
                          asset: AppAssets.company,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    32.vs,
                    CustomButton(
                      text: AppStrings.edit.trans,
                      onPressed: () {
                        if (dontHaveErrors(context)) {
                          context.read<EditProfileCubit>().editProfile(EditProfileRequestModel(
                            email: emailController.text,
                            phone: phoneController.text,
                            name:  nameController.text,
                            companyName: companyNameController.text,
                            language: 'ar'
                          ));
                        }
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
