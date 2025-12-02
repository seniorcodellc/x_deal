import 'package:x_deal/exports.dart';
abstract class LanguageRepo {
  Future<Either<Failure, ResponseModel>> changeLanguage({required String language});
  Future<Either<Failure, ResponseModel>> getSavedLanguage();
}
