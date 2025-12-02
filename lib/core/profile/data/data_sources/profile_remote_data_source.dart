import 'package:x_deal/config/data_generic/data/data_sources/generic_data_remote_data_source.dart';
import 'package:x_deal/exports.dart';

import '../models/profile_response_model.dart';


abstract class ProfileRemoteDataSource extends GenericRemoteDataSource{
}

class ProfileRemoteDataSourceImpl extends RequestsImpl
    implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required super.dioConsumer});


  @override
  Future<ResponseModel> getData({num? id, query})=>getRequest(
  endPoint: EndPoints.profile,
  getFromJsonFunction: ProfileResponseModel.fromJson,
  );
}
