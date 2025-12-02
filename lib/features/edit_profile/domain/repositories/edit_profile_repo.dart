import "package:x_deal/exports.dart";
import "package:x_deal/features/edit_profile/data/models/edit_profile_request_model.dart";

abstract class EditProfileRepo {
  Future<Either<Failure, ResponseModel>> editProfile({
    required EditProfileRequestModel editProfileRequestModel,
  });
}
