import '../../../../exports.dart';

class AboutPlaceTab extends StatelessWidget {
  const AboutPlaceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.0.w, vertical: 16.0.h),
      child: Column(
        children: [
          buildCustomContainer(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('سلينترو كافيه', style: getBoldTextStyle(fontSize: 16)),
                8.vs,
                Text(
                  'مقهى سلينترو هو وجهتك المثالية للاستمتاع بأفضل أنواع القهوة المحمصة بعناية والحلويات الطازجة.\n نقدم تجربة فريدة في أجواء عصرية ومريحة تناسب\n جميع الأذواق.',
                  style: getRegularTextStyle(fontSize: 12.5),
                ),
              ],
            ),),
          16.vs,
          buildCustomContainer(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('مواعيد العمل', style: getBoldTextStyle(fontSize: 16)),
                10.vs,
                Row(
                  children: [
                    CustomSVGImage(asset: AppAssets.clock),
                    8.hs,
                    Text('يوميًا من 9 صباحًا: 1 بعد منتصف الليل.', style: getRegularTextStyle(fontSize: 13)),

                  ],
                )
              ],
            ),),
          16.vs,
          buildCustomContainer(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('مواقع التواصل', style: getBoldTextStyle(fontSize: 15)),
                10.vs,
                Row(
                  children: [
                    CustomSVGImage(asset: AppAssets.instagram),
                    16.hs,
                    CustomSVGImage(asset: AppAssets.facebook),
                    16.hs,
                    CustomSVGImage(asset: AppAssets.whatsapp),
                  ],
                )
              ],
            ),),
          16.vs,
          buildCustomContainer(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('عنوان الفرع', style: getBoldTextStyle(fontSize: 16)),
              10.vs,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('90 شارع معادى شارع 9 معادى', style: getRegularTextStyle(fontSize: 14,color: AppColors.gray)),
                  CustomSVGImage(asset: AppAssets.direction),
                ],
              )
            ],
          ),),
          16.vs,
          buildCustomContainer(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('رقم الفرع', style: getBoldTextStyle(fontSize: 16)),
              10.vs,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' 16457', style: getRegularTextStyle(fontSize: 14,color: AppColors.gray)),
                  CustomSVGImage(asset: AppAssets.phone),
                ],
              )
            ],
          ),),
          16.vs,
          CustomButton(text: 'استخدم العرض الآن', onPressed: (){}),
          16.vs,
        ],
      ),
    );
  }

  Widget buildCustomContainer({required Widget child}) {
    {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: Padding(
          padding: getPadding(all: 16.0.w),
          child: child,
        ),
      );
    }
  }
}
