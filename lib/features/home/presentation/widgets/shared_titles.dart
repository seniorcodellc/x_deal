import '../../../../exports.dart';

class SharedTitles extends StatelessWidget {
  const SharedTitles({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.trans, style: getBoldTextStyle(fontSize: 16)),
          Text(
            AppStrings.seeAll.trans,
            style: getRegularTextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
