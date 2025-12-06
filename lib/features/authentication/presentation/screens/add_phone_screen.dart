import 'package:x_deal/exports.dart';
import '../../../../config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/h_line.dart';
class AddPhoneScreen extends StatelessWidget {
   AddPhoneScreen({super.key});
  final TextEditingController numberController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  30.vs,
                  Text(
                    AppStrings.addPhoneNumber.trans,
                    style: getBoldTextStyle(fontSize: 24, color: AppColors.blackText),
                  ),
                  40.vs,
                  Text(
                    AppStrings.updateYourPhone.trans,
                    style: getSemiBoldTextStyle(fontSize: 24, color: AppColors.primaryColor),
                  ),
                  20.vs,
                  Text(
                    textAlign: TextAlign.center,
                   AppStrings.phoneUpdateDescription.trans,
                    style: getRegularTextStyle(fontSize: 14, color: AppColors.gray),
                  ),
                  8.vs,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(horizontal: 16.0.w),
                        child: Text(
                          AppStrings.phoneNumber.trans,
                          style: getRegularTextStyle(fontSize: 15, color: AppColors.darkGray),
                        ),
                      ),
                      16.vs,
                      CustomTextFormField(
                        controller: numberController,
                        prefixIcon: Padding(
                          padding: getPadding(start: 16.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomSVGImage(asset: AppAssets.egypt, fit: BoxFit.none,),
                              8.hs,
                              Text(
                                '(+20)',
                                style: getRegularTextStyle(fontSize: 15, color: AppColors.blackText,),
                              ),
                              3.hs,
                              VLine(color: AppColors.grayBorder, thik: 1),
                            ],
                          ),
                        ),
                        hintText: AppStrings.enterYourPhoneNumber.trans,
                        style: getRegularTextStyle(fontSize: 15,color: AppColors.grayBorder),
                      ),
                      BlocBuilder<ErrorCubit, CubitStates>(
                        builder: (context, state) => ErrorText(
                          showError: context.read<ErrorCubit>().errors.contains(
                            Errors.PHONE_ERROR,
                          ),
                          text: getError[Errors.PHONE_ERROR],
                        ),
                      ),
                    ],
                  ),
                  150.vs,
                  Padding(
                    padding: getPadding(horizontal: 16.0.w),
                    child: CustomButton(
                      text: AppStrings.next.trans,
                      style: getRegularTextStyle(color: AppColors.white),
                      borderRadius: 25,
                      onPressed: () {
                        checkStringError(context, numberController.text, Errors.PHONE_ERROR,);
                        if (dontHaveErrors(context)) {
                          Routes.successPhone.moveTo();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
