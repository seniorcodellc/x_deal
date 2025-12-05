import 'package:x_deal/core/widgets/custom_background.dart';
import 'package:x_deal/features/forget_password/presentation/widgets/enter_code_screen_otp.dart';

import '../../../../config/errors/widgets/error_text.dart';
import '../../../../exports.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Padding(
        padding: getPadding(horizontal: 16.w, top: 40.61.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomPngImage(image: AppAssets.logoText),
                  71.vs,
                  Text(
                    AppStrings.checkCode.trans,
                    style: getSemiBoldTextStyle(
                      fontSize: 24,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  8.vs,
                  Text(
                    AppStrings.sendCodeToNumForVerify,
                    style: getRegularTextStyle(fontSize: 16),
                  ),
                  24.vs,
                  EnterCodeScreenOtp(otpController: otpController),
                  BlocBuilder<ErrorCubit, CubitStates>(
                    builder: (context, state) => ErrorText(
                      showError: context.read<ErrorCubit>().errors.contains(
                        Errors.OTP_ERROR,
                      ),
                      text: getError[Errors.OTP_ERROR],
                    ),
                  ),
                  40.vs,
                  CustomButton(
                    text: AppStrings.checkCodeButton,
                    onPressed: () {
                      checkStringError(
                        context,
                        otpController.text,
                        Errors.OTP_ERROR,
                      );
                      if (dontHaveErrors(context)) {
                        Routes.signUp.moveTo();
                      }
                    },
                  ),
                  40.vs,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.notDeliverCheckCode,
                          style: getRegularTextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: AppStrings.resend.trans,
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
    );
  }
}
