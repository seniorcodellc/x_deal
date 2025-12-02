import 'package:x_deal/exports.dart';
import '../repositories/language_repo.dart';

class LanguageUseCases {
  final LanguageRepo languageRepo;
  LanguageUseCases({required this.languageRepo});
  Future<Either<Failure, ResponseModel>> changeLanguage({required String language}) async =>
      await languageRepo.changeLanguage(language: language);
  Future<Either<Failure, ResponseModel>> getSavedLanguage() async => await languageRepo.getSavedLanguage();
}
