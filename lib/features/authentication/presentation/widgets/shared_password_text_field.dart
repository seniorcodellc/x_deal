import 'package:x_deal/exports.dart';
import 'package:x_deal/config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SharedPasswordTextField extends StatefulWidget {
  SharedPasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;
  @override
  State<SharedPasswordTextField> createState() =>
      _SharedPasswordTextFieldState();
}

class _SharedPasswordTextFieldState extends State<SharedPasswordTextField> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          obscureText: secure,
          controller: widget.passwordController,
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
              Errors.PASSWORD_ERROR,
            ),
            text: getError[Errors.PASSWORD_ERROR],
          ),
        ),
      ],
    );
  }
}
