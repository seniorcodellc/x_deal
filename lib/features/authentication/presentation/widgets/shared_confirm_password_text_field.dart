import 'package:x_deal/exports.dart';
import 'package:x_deal/config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SharedConfirmPasswordTextField extends StatefulWidget {
  const SharedConfirmPasswordTextField({
    super.key,
    required this.confirmPasswordController,
  });

  final TextEditingController confirmPasswordController;

  @override
  State<SharedConfirmPasswordTextField> createState() =>
      _SharedConfirmPasswordTextFieldState();
}

class _SharedConfirmPasswordTextFieldState
    extends State<SharedConfirmPasswordTextField> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          obscureText: secure,
          controller: widget.confirmPasswordController,
          hintText: AppStrings.passwordHint.trans,
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
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) => ErrorText(
            showError: context.read<ErrorCubit>().errors.contains(
              Errors.MATCHING_PASSWORD_ERROR,
            ),
            text: getError[Errors.MATCHING_PASSWORD_ERROR],
          ),
        ),
      ],
    );
  }
}
