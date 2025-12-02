import 'package:x_deal/config/data_generic/presentation/widgets/generic_data_view.dart';
import 'package:x_deal/config/errors/widgets/error_text.dart';
import 'package:x_deal/features/authentication/presentation/managers/question_cubit.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../exports.dart';

class TechAnswerVerficationQuestion extends StatelessWidget {
  const TechAnswerVerficationQuestion({
    super.key,
    required this.answerController,
  });
  final TextEditingController answerController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericDataView<QuestionCubit, String>.fromState(
          buildLoadedWidgetWithState: (state) => Column(
            children: [
              Container(
                padding: getPadding(vertical: 11.h, start: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),

                child: Row(
                  children: [
                    state is LoadedState<String>
                        ? CustomSVGImage(asset: AppAssets.questionMark)
                        : SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),

                    16.hs,
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: AnimatedSwitcher(
                          duration: 100.microseconds,
                          child: Text(
                            state is LoadedState<String>
                                ? state.data
                                : AppStrings.merchantCheckHint,
                            style: getRegularTextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              10.vs,
              AnimatedSwitcher(
                duration: 100.microseconds,
                child: state is LoadedState
                    ? Padding(
                        padding: getPadding(start: 16.h),
                        child: CustomTextFormField(
                          hintText: AppStrings.merchantCheckHint.trans,
                          controller: answerController,
                          style: getRegularTextStyle(fontSize: 14.sp),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) {
            return ErrorText(
              showError: context.read<ErrorCubit>().errors.contains(
                Errors.VERIFICATION_ERROR,
              ),
              text: getError[Errors.VERIFICATION_ERROR],
            );
          },
        ),
      ],
    );
  }
}
