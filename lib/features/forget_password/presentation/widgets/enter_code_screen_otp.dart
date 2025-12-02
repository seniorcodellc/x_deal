import 'package:x_deal/exports.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../config/errors/widgets/error_text.dart';

class EnterCodeScreenOtp extends StatelessWidget {
  const EnterCodeScreenOtp({super.key, required this.otpController});
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PinCodeTextField(
          controller: otpController,
          appContext: context,
          length: 5,
          autoFocus: true,
          obscureText: false,
          keyboardType: TextInputType.number,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15.r),
            fieldHeight: 50.h,
            fieldWidth: 50.w,
            fieldOuterPadding: getPadding(horizontal: 8.w),
            activeColor: AppColors.white,
            selectedColor: AppColors.white,
            inactiveColor: AppColors.white,
            selectedFillColor: AppColors.white,
            activeFillColor: AppColors.white,
            inactiveFillColor: AppColors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          onTap: () {},
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) => ErrorText(
            showError: context.read<ErrorCubit>().errors.contains(
              Errors.VERIFICATION_ERROR,
            ),
            text: getError[Errors.VERIFICATION_ERROR],
          ),
        ),
      ],
    );
  }
}
