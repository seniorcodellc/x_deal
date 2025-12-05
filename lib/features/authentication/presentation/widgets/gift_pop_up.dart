import 'package:x_deal/core/widgets/custom_text_form_field.dart';

import '../../../../config/errors/widgets/error_text.dart';
import '../../../../exports.dart';

class GiftPopup extends StatelessWidget {
  GiftPopup({super.key});
  final TextEditingController codeController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: getPadding(vertical: 24.0.h, horizontal: 16.0.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 97.w,
                    height: 97.h,
                    child: CustomPngImage(image: AppAssets.gift),
                  ),
                  Text(
                    AppStrings.sharedCode,
                    style: getSemiBoldTextStyle(fontSize: 24),
                  ),
                  8.vs,
                  Text(
                    AppStrings.giftPopUpHeader,
                    style: getSemiBoldTextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  34.vs,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.sharedCode,
                        style: getRegularTextStyle(fontSize: 16),
                      ),
                      8.vs,
                      CustomTextFormField(
                        hintText: AppStrings.writeHere,
                        controller: codeController,
                      ),
                      // BlocBuilder<ErrorCubit, CubitStates>(
                      //   builder: (context, state) => ErrorText(
                      //     showError: context.read<ErrorCubit>().errors.contains(
                      //       Errors.CODE_ERROR,
                      //     ),
                      //     text: getError[Errors.CODE_ERROR],
                      //   ),
                      // ),
                    ],
                  ),

                  24.vs,
                  CustomButton(
                    text: AppStrings.confirm.trans,
                    onPressed: () {
                      // checkStringError(
                      //   context,
                      //   codeController.text,
                      //   Errors.CODE_ERROR,
                      // );
                      if (dontHaveErrors(context)) {}
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(start: 16.w, top: 16.h),
            child: GestureDetector(
              onTap: () {
                pop();
              },
              child: CustomSVGImage(asset: AppAssets.cancel),
            ),
          ),
        ],
      ),
    );
  }
}
