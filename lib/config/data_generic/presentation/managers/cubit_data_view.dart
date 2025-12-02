
import '../../../../exports.dart';

abstract class GenericCubit<Model> extends Cubit<CubitStates> {
  final GenericUseCases genericUseCases;
  Model? model;

  GenericCubit({required this.genericUseCases}) : super(InitialState());
  requestData({
    num? id,
    dynamic query,
    dynamic Function(Model?)? onSuccess,

    Function(ResponseModel data)? onSuccessWithMessage,

    dynamic Function(String)? onFail,
  }) => managerExecute<Model>(
    genericUseCases.getData(query: query, id: id),
    onFail: (message) {
      if (onFail.isNotNull) {
        onFail?.call(message);
      } else {
        emit(FailedState(message: message));
      }
    },
    onSuccessWithMessage: (data) {
      onSuccessWithMessage?.call(data);
    },
    onSuccess: (Model? data) {
      if (onSuccess.isNotNull) {
        onSuccess?.call(data);
      } else {
        model = data;
        emit(LoadedState<Model>(data: model!));
      }
    },
  );
  requestDataWithDialog({
    num? id,
    dynamic query,
    dynamic Function(Model?)? onSuccess,
    required String startingMessage,
    Function(ResponseModel data)? onSuccessWithMessage,

    dynamic Function(String)? onFail,
  }) => executeWithDialog<Model>(
    either:genericUseCases.getData(query: query, id: id),
    onError: (message) {
      if (onFail.isNotNull) {
        onFail?.call(message);
      } else {
        emit(FailedState(message: message));
      }
    },
    onSuccessWithMessage: (response) {
      onSuccessWithMessage?.call(response);
    },
    onSuccess: (Model? data) {
      if (onSuccess.isNotNull) {
        onSuccess?.call(data);
      } else {
        model = data;
        emit(LoadedState<Model>(data: model!));
      }
    },
    startingMessage: startingMessage
  );
}
