import '../../../../exports.dart';

class TermsTab extends StatelessWidget {
  const TermsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.vs,
          Text('تفاصيل العروض وشروط الاستخدام',style: getBoldTextStyle(fontSize: 16),),
          16.vs,
          Text('مع عرض XDEAL الحصري، احصل على خصم 20% على جميع المشروبات والمأكولات، بالإضافة إلى كسب نقاط XCOIN مع كل عملية شراء.',style: getRegularTextStyle(fontSize: 13),),
          24.vs,
          buildTerms(),
          24.vs,
          CustomButton(text: 'استخدم العرض الآن', onPressed: (){}),
          16.vs
        ],
      ),
    );
  }

  Widget buildTerms() {
    return Container(
      width: 343.w,
      decoration: BoxDecoration(
        color: AppColors.mutedPrimaryColor,
        borderRadius: BorderRadius.circular(25.0.r),
        border: Border.all(color: AppColors.primaryColor)
      ),
      child: Padding(
        padding: getPadding(vertical: 16.0.h,horizontal: 14.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('شروط الاستخدام',style: getBoldTextStyle(fontSize: 16),),
            16.vs,
            Text('▪العرض صالح على جميع العناصر في المنيو',style: getRegularTextStyle(fontSize: 14),),
            8.vs,
            Text('▪ لا يمكن دمجه مع عروض أخرى',style: getRegularTextStyle(fontSize: 14),),
            8.vs,
            Text('▪يجب إظهار كود العرض قبل الطلب',style: getRegularTextStyle(fontSize: 14),),
          ],
        ),
      ),
    );
  }
}
