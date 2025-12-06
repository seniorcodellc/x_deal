import 'package:x_deal/exports.dart';
import 'package:x_deal/features/on_boarding/presentation/managers/onboarding_manager_cubit.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({
    super.key,
    required this.onTap,
    required this.text,
    required this.text2,
  });
  final VoidCallback onTap;
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: text,
              onPressed: onTap,
              height: 52.0.h,
              backgroundColor: AppColors.primaryColor,
              borderRadius: 25,
              width: 155.w,
            ),
            10.hs,
            CustomButton(
              text: text2,
              onPressed: () async {await context.read<OnboardingManagerCubit>().cachedNewInstall();},
              height: 52.0.h,
              backgroundColor: AppColors.white,
              borderColor: AppColors.primaryColor,
              borderRadius: 25,
              width: 155.w,
              textColor: AppColors.primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
