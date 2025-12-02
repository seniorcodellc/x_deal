


import '../../../../config/constants/localization_constants.dart';
import '../../../../exports.dart';
import '../../domain/use_cases/language_usecases.dart';

class LanguageCubit extends Cubit<CubitStates> {
  final LanguageUseCases languageUseCases;
  bool isEn = true;
  Locale locale = AppLocalizationsConstants().enLocale;

  LanguageCubit({required this.languageUseCases}) : super(InitialState());
  /*get saved language */
  Future<bool> getSavedLanguage() async {
    bool isLanguageSaved = false;
    await managerExecute<String?>(
      languageUseCases.getSavedLanguage(),
      onSuccess: (data) {
        if (data.isNotNull) {
          isEn = data.isEqualTo(AppLocalizationsConstants().enLocale.languageCode);
          locale = isEn ? AppLocalizationsConstants().enLocale : AppLocalizationsConstants().arLocale;
          isLanguageSaved = true;
        }
      },
    );

    return isLanguageSaved;
  }

  /*change language */
  Future<bool> _changeLanguage({required bool isEnglish}) async {
    Locale loc = isEnglish ? AppLocalizationsConstants().enLocale : AppLocalizationsConstants().arLocale;
    return (await managerExecute<bool>(
      languageUseCases.changeLanguage(language: loc.languageCode),
      onSuccess: (data) {
        locale = loc;
        isEn = isEnglish;
        emit(ChangeState());
      },
    ))
        .orFalse;
  }

  Future<void> toEnglish() async {
    _changeLanguage(isEnglish: true);
  }

  Future<void> toArabic() async {
    _changeLanguage(isEnglish: false);
  }
}
