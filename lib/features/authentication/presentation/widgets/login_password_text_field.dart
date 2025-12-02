import 'package:x_deal/exports.dart';
import 'package:x_deal/config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginPasswordTextField extends StatefulWidget {
  LoginPasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<LoginPasswordTextField> createState() => _LoginPasswordTextFieldState();
}

class _LoginPasswordTextFieldState extends State<LoginPasswordTextField> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller: widget.passwordController,
          hintText: AppStrings.passwordHint,
          style: getRegularTextStyle(color: AppColors.darkGray, fontSize: 14),
          obscureText: secure,
          prefixIcon: CustomSVGImage(asset: AppAssets.lock, fit: BoxFit.none),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                secure = !secure;
              });
            },
            child: CustomSVGImage(asset: AppAssets.eyeOn, fit: BoxFit.none),
          ),
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
          ],
        ),
      ],
    );
  }
}
