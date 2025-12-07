import 'package:x_deal/features/store_details/data/data_sources/static.dart';
import '../../../../exports.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(vertical: 24.0.h, horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('آراء العملاء', style: getBoldTextStyle(fontSize: 16),),
              Text('(127)', style: getRegularTextStyle(fontSize: 16, color: AppColors.gray,),
              ),
            ],
          ),
          8.vs,
          Column(
            children: List.generate(Statics.reviewsList.length,(index){
              final model = Statics.reviewsList[index];
              return  Padding(
                padding: getPadding(vertical: 10.0.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grayBorder),
                    borderRadius: BorderRadius.circular(25.0.r),
                  ),
                  child: Padding(
                    padding: getPadding(horizontal: 18.0.w, vertical: 18.0.w,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomSVGImage(asset: model.profileImage),
                                8.hs,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(model.name, style: getRegularTextStyle(fontSize: 14, color: AppColors.gray,),),
                                    4.vs,
                                    SizedBox(
                                      height: 15.h,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics:
                                        const NeverScrollableScrollPhysics(),
                                        itemCount: 5,
                                        itemBuilder: (context, i) => Icon(
                                          Icons.star_rounded,
                                          size: 18,
                                          color: i < model.rating
                                              ? AppColors.yellow
                                              : AppColors.gray,
                                        ),
                                        separatorBuilder: (_, __) => 1.hs,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(model.timeAgo, style: getRegularTextStyle(fontSize: 14, color: AppColors.grayHint,),
                            ),
                          ],
                        ),
                        16.vs,
                        Text(model.comment, style: getRegularTextStyle(fontSize: 13),),
                      ],
                    ),
                  ),
                ),
              );
            }
              ),

          ),
        ],
      ),
    );
  }
}
