import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/enter_code_screen_conclusion.dart';
import '../widgets/enter_code_screen_otp.dart';
import '../widgets/shared_forget_password_title.dart';

class EnterCodeScreen extends StatelessWidget {
  EnterCodeScreen({super.key});
  TextEditingController otpController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    email = data!['email'];
    return CustomBackground(
      appBar: CustomAppbar(title: ''),
      showAppbar: true,
      appBarBackgroundColor: AppColors.bgColor,
      child: Padding(
        padding: getPadding(horizontal: 16.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.vs,
              SharedForgetPasswordTitle(),
              20.vs,
              Text(
                AppStrings.enterCodeScreenHeader.trans,
                style: getRegularTextStyle(
                  color: AppColors.darkGray,
                  height: 2,
                ),
              ),
              24.vs,
              EnterCodeScreenOtp(otpController: otpController),
              40.vs,
              CustomButton(
                text: AppStrings.checkCode.trans,
                style: getRegularTextStyle(color: AppColors.white),
                onPressed: () {
                  checkStringError(
                    context,
                    otpController.text,
                    Errors.VERIFICATION_ERROR,
                  );
                  if (dontHaveErrors(context)) {
                    Routes.forgetPasswordRoute2.moveTo();
                  }
                },
              ),
              32.vs,
              EnterCodeScreenConclusion(),
            ],
          ),
        ),
      ),
    );
  }
}
