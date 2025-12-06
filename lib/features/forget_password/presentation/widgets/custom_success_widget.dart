import '../../../../exports.dart';

class CustomSuccessWidget extends StatelessWidget {
  const CustomSuccessWidget({super.key, required this.title, required this.subTitle});
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Column(
          children: [
            50.vs,
            CustomPngImage(image: AppAssets.decoration),
          ],
        ),
        Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPngImage(image: AppAssets.successPassword),
                45.vs,
                Text(title,style: getSemiBoldTextStyle(fontSize: 22,color:AppColors.blackText ),),
                16.vs,
                Text(subTitle,textAlign: TextAlign.center,
                  style: getRegularTextStyle(fontSize: 15,color:AppColors.gray ),),
                40.vs,
                Padding(
                  padding: getPadding(horizontal: 16.0.w),
                  child: CustomButton(
                    text: AppStrings.home.trans,
                    height: 60.0.h,
                    backgroundColor: AppColors.primaryColor,
                    borderRadius: 25,
                    onPressed:(){},
                  ),
                ),

              ],
            )),
      ],
    );
  }
}
