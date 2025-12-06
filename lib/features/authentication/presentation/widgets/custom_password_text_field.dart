import 'package:x_deal/exports.dart';
import 'package:x_deal/config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField({super.key, required this.passwordController, required this.text});

  final TextEditingController passwordController;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,style: getRegularTextStyle(fontSize: 16,color: AppColors.blackText),),
          10.vs,
          CustomTextFormField(
            controller: passwordController,
            hintText: AppStrings.passwordHint,
            style: getRegularTextStyle(color: AppColors.iconColor, fontSize: 14),
            obscureText: true,
            isPassword: true,
          ),
          8.vs,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ErrorCubit, CubitStates>(
                builder: (context, state) => ErrorText(
                  showError: context.read<ErrorCubit>().errors.contains(
                    Errors.PASSWORD_ERROR,
                  ),
                  text: getError[Errors.PASSWORD_ERROR],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
