import 'package:x_deal/exports.dart';
abstract class LanguageLocalDataSource {
  Future<ResponseModel> changeLanguage({required String language});
  Future<ResponseModel> getSavedLanguage();
}

class LanguageImplWithPrefs extends CacheImpl implements LanguageLocalDataSource  {
  LanguageImplWithPrefs({required super.sharedPreferences});
  @override
  Future<ResponseModel> changeLanguage({required String language}) => cacheWrite(
        AppPrefs.prefsLanguageKey,
        language,
        afterCaching: () {
          AppPrefs.language = language;

        },
      );

  @override
  Future<ResponseModel> getSavedLanguage() => cacheRead<String?>(

        AppPrefs.prefsLanguageKey,
        afterCaching: (language) {
          if (language.isNotNullOrEmpty) {
            AppPrefs.language = language!;
          }
        },
      );



}
