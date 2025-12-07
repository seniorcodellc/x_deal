import 'package:x_deal/exports.dart';

import '../../../../core/widgets/custom_background.dart';
import '../../data/static/static.dart';
import '../managers/onboarding_manager_cubit.dart';
import '../widgets/onboarding_dots.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() async {
    if (currentPage < OnboardingStatics.onBoardingItems.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    } else {
      await context.read<OnboardingManagerCubit>().cachedNewInstall();
      Routes.loginRoute.moveTo();
    }
  }
  void skip() async{
    if (currentPage < OnboardingStatics.onBoardingItems.length - 1) {
      pageController.jumpToPage(OnboardingStatics.onBoardingItems.length - 1);
    } else {
      await context.read<OnboardingManagerCubit>().cachedNewInstall();
      Routes.signUpByPhoneOrEmail.moveTo();
    }
  }
  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == OnboardingStatics.onBoardingItems.length - 1;
    return CustomBackground(
      backgroundColor: AppColors.white,
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int page) {setState(() {currentPage = page;});},
        itemCount: OnboardingStatics.onBoardingItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: getPadding(horizontal: 22.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                80.vs,
                CustomPngImage(image: OnboardingStatics.onBoardingItems[index].imagePath),
                45.vs,
                Text(
                  OnboardingStatics.onBoardingItems[index].title.trans, textAlign: TextAlign.center,
                  style: getRegularTextStyle(fontSize: 16, color: AppColors.primaryColor),),
                8.vs,
                Text(
                  OnboardingStatics.onBoardingItems[index].subTitle.trans, textAlign: TextAlign.center,
                  style: getRegularTextStyle(fontSize: 22, color: AppColors.blackText),),
                25.vs,
                OnboardingDots(currentPage: currentPage),
                40.vs,
                Row(
                  children: [
                    CustomButton(
                      text: isLastPage ? AppStrings.login.trans : AppStrings.next.trans,
                      onPressed: (){ nextPage();}, height: 52.0.h,
                      backgroundColor: AppColors.primaryColor, borderRadius: 25, width: 155.w,
                    ),
                    12.hs,
                    CustomButton(
                      text: isLastPage? AppStrings.createAccount.trans : AppStrings.skip.trans,
                      onPressed: () {skip();}, height: 52.0.h, backgroundColor: AppColors.white,
                      borderColor: AppColors.primaryColor, borderRadius: 25, width: 155.w, textColor: AppColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
