import 'package:x_deal/exports.dart';
import 'package:x_deal/features/edit_profile/data/models/edit_profile_request_model.dart';
import 'package:x_deal/features/edit_profile/domain/use_cases/edit_profile_use_case.dart';

import '../../../../config/local_notification/local_notification.dart';
class EditProfileCubit extends Cubit<CubitStates>{
  EditProfileUseCase editProfileUseCase;
  EditProfileCubit({required this.editProfileUseCase}) : super(InitialState());


  editProfile(EditProfileRequestModel editProfileRequestModel) async {
    await executeWithDialog(
      either: editProfileUseCase.editProfile(editProfileRequestModel: editProfileRequestModel),
      startingMessage: AppStrings.waitingForRegistration.trans,
      onSuccess: (data) async {
        checkNotificationPermissionAndDoOperation(
          getContext,
          onSuccess: () {
            NotificationsService().showSimpleNotification(
              title: AppStrings.verificationAccount.trans,
              description: AppStrings.pleaseWaitUntilApproved.trans,
            );
          },
        );
      },
    );
  }

}