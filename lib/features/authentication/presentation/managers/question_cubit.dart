import 'package:x_deal/config/data_generic/presentation/managers/cubit_data_view.dart';
import 'package:x_deal/features/authentication/domain/usecase/question_use_cases.dart';

class QuestionCubit extends GenericCubit<String>{
  final QuestionUseCases questionUseCases;
   QuestionCubit({required this.questionUseCases}):super(genericUseCases: questionUseCases);
}