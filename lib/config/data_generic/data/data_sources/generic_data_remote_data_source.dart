import '../../../../exports.dart';

abstract class GenericRemoteDataSource {
  Future<ResponseModel> getData({num? id, dynamic query});
}


