import 'package:x_deal/exports.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../config/errors/widgets/error_text.dart';

class EnterCodeScreenOtp extends StatelessWidget {
  const EnterCodeScreenOtp({super.key, required this.otpController});
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PinCodeTextField(
          controller: otpController,
          appContext: context,
          length: 6,
          autoFocus: true,
          obscureText: false,
          keyboardType: TextInputType.number,
          textStyle: getBoldTextStyle(fontSize: 24,color:AppColors.primaryColor),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15.r),
            fieldHeight: 52.h,
            fieldWidth: 50.w,
            fieldOuterPadding: getPadding(horizontal: 3.w),
            inactiveColor: AppColors.grayBorder,
            activeColor: AppColors.black,
            selectedColor: AppColors.black,
            selectedFillColor: AppColors.white,
            activeFillColor: AppColors.white,
            inactiveFillColor: AppColors.white,
          ),
          animationDuration: const Duration(milliseconds: 200),
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
