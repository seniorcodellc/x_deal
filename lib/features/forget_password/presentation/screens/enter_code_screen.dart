import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/enter_code_screen_otp.dart';

class EnterCodeScreen extends StatelessWidget {
  EnterCodeScreen({super.key});
  final TextEditingController otpController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(title: ''),
      backgroundColor: AppColors.white,
      showAppbar: true,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:  Padding(
              padding: getPadding(horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    24.vs,
                    Text(AppStrings.forgetPassword.trans, style: getSemiBoldTextStyle(fontSize: 24, color: AppColors.primaryColor),),
                    20.vs,
                    Text(AppStrings.enterCodeScreenHeader.trans, textAlign: TextAlign.center,
                      style: getRegularTextStyle(color: AppColors.gray, height: 2,),),
                    24.vs,
                    EnterCodeScreenOtp(otpController: otpController),
                    40.vs,
                    CustomButton(
                      text: AppStrings.checkCode.trans,
                      style: getRegularTextStyle(color: AppColors.white),
                      onPressed: () {
                        checkStringError(context, otpController.text, Errors.VERIFICATION_ERROR,);
                        if (dontHaveErrors(context)) {
                          Routes.resetPasswordRoute.moveTo();
                        }
                      },
                    ),
                    32.vs,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.checkCodeConclusion1.trans,
                          style: getRegularTextStyle(
                            color: AppColors.subTitleColor,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          AppStrings.checkCodeConclusion2.trans,
                          style: getRegularTextStyle(
                            color: AppColors.mainColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
