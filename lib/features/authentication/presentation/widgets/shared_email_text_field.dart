import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../exports.dart';
import 'package:x_deal/config/errors/widgets/error_text.dart';

class SharedEmailTextField extends StatelessWidget {
  const SharedEmailTextField({
    super.key,
    required this.emailController,
    required this.text,
  });
  final TextEditingController emailController;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: getRegularTextStyle(
              fontSize: 15,
              color: AppColors.blackText,
            ),
          ),
          10.vs,
          CustomTextFormField(
            controller: emailController,
            hintText: AppStrings.emailHint.trans,
            style: getRegularTextStyle(
              color: AppColors.iconColor,
              fontSize: 14,
            ),
          ),
          BlocBuilder<ErrorCubit, CubitStates>(
            builder: (context, state) => ErrorText(
              showError: context.read<ErrorCubit>().errors.contains(
                Errors.EMAIL_ERROR,
              ),
              text: getError[Errors.EMAIL_ERROR],
            ),
          ),
        ],
      ),
    );
  }
}
