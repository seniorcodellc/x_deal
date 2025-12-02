import 'package:x_deal/features/authentication/domain/repositories/question_repo.dart';

import '../../../../config/data_generic/domain/use_cases/generic_use_case.dart';

class QuestionUseCases extends GenericUseCases{
  final QuestionRepo questionRepo;
  QuestionUseCases({required this.questionRepo}):super(genericRepo: questionRepo);
}