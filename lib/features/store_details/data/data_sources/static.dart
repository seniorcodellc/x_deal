import '../../../../core/utils/app_assets.dart';
import '../models/review_model.dart';

class Statics{
   static final List<ReviewModel> reviewsList = [
    ReviewModel(
      name: "محمد علي",
      profileImage: AppAssets.profilePic,
      rating: 5,
      timeAgo: "منذ 3 أيام",
      comment: "القهوة جميلة والأسعار معقولة .. ارجو الاستمرار بنفس الجودة",
    ),
    ReviewModel(
      name: "محمد علي",
      profileImage: AppAssets.profilePic,
      rating: 5,
      timeAgo: "منذ 3 أيام",
      comment: "القهوة جميلة والأسعار معقولة .. ارجو الاستمرار بنفس الجودة",
    ),
     ReviewModel(
      name: "أحمد يوسف",
      profileImage: AppAssets.profilePic,
      rating: 4.5,
      timeAgo: "منذ يوم واحد",
      comment: "المكان مريح والموظفين متعاونين .. ارجو الاستمرار بنفس الجودة",
    ),
     ReviewModel(
      name: "محمد محمود",
      profileImage: AppAssets.profilePic,
      rating: 4,
      timeAgo: "منذ أسبوع",
      comment: "البيتزا جميلة والأسعار معقولة .. ارجو الاستمرار بنفس الجودة",
    ),
  ];

}