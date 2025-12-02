import 'package:x_deal/config/list_generic/presentation/manager/cubit_list_view.dart';
import 'package:x_deal/features/authentication/data/model/response_model/governorate_response_model.dart';
import 'package:x_deal/features/authentication/domain/usecase/governorates_use_cases.dart';

class GovernoratesCubit extends CubitListView<GovernorateModel>{
  GovernoratesUseCases governoratesUseCases;
  GovernoratesCubit({required this.governoratesUseCases}):super(listUseCases: governoratesUseCases);
}