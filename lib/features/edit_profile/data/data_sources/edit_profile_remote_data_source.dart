import 'package:x_deal/exports.dart';
import 'package:x_deal/features/edit_profile/data/models/edit_profile_request_model.dart';

import '../../../authentication/data/model/response_model/login_response_model.dart';
abstract class EditProfileRemoteDataSource{
  Future<ResponseModel> editProfile({required EditProfileRequestModel editProfileRequestModel});
}
class EditProfileRemoteDataSourceImpl extends RequestsImpl implements EditProfileRemoteDataSource {
  EditProfileRemoteDataSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> editProfile({required EditProfileRequestModel editProfileRequestModel}) => postRequest(
    endPoint: EndPoints.editProfile,
    data: editProfileRequestModel.toJson(),
    isFormData: true,
    getFromJsonFunction: UserResponseModel.fromJson,
  );
}