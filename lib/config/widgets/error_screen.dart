import 'package:x_deal/core/widgets/second_shared_custom_button.dart';
import 'package:x_deal/exports.dart';
import 'package:x_deal/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';

import '../../core/widgets/custom_background.dart';
import 'error_screen_header.dart';

class ErrorScreen extends StatelessWidget {
  String? message;
  ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    message = data?['message'];
    return CustomBackground(
      showAppbar: true,
      appBarBackgroundColor: AppColors.bgColor,
      child: Padding(
        padding: getPadding(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: ErrorScreenHeader(message: message.validate)),

            Flexible(
              child: CustomElevatedButton(
                text: AppStrings.goToHomepage.trans,
                onPressed: () {
                  context.read<BottomNavOperationCubit>().goToHome();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
