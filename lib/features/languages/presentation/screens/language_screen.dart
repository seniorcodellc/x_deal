import 'package:x_deal/core/widgets/custom_appbar.dart';
import 'package:x_deal/core/widgets/custom_background.dart';
import '../../../../config/constants/localization_constants.dart';
import '../../../../exports.dart';
import '../../../languages/presentation/manager/language_cubit.dart';
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late bool isEnglish;

  @override
  void initState() {
    super.initState();
    isEnglish = context.read<LanguageCubit>().isEn;
  }

  void _saveLanguage() {
    if (isEnglish) {
      context.setLocale(AppLocalizationsConstants().enLocale);
      context.read<LanguageCubit>().toEnglish();
    } else {
      context.setLocale(AppLocalizationsConstants().arLocale);
      context.read<LanguageCubit>().toArabic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showAppbar: true,
      appBar: CustomAppbar(title: AppStrings.language.trans),
      child: Padding(
        padding: getPadding(vertical: 30.0.h, horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                buildLanguage(
                  title: AppStrings.arabicLanguage.trans,
                  isSelected: !isEnglish,
                  onTap: () => setState(() => isEnglish = false),
                ),
                22.vs,
                buildLanguage(
                  title: AppStrings.englishLanguage.trans,
                  isSelected: isEnglish,
                  onTap: () => setState(() => isEnglish = true),
                ),
              ],
            ),
            CustomButton(
              text: AppStrings.save.trans,
              onPressed: _saveLanguage,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLanguage({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.0.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Padding(
          padding: getPadding(horizontal: 16.0.w, vertical:18.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: getMediumTextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
              isSelected? CustomSVGImage(asset: AppAssets.checkCircle,):SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}