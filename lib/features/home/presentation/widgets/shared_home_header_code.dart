import '../../../../exports.dart';

class SharedHomeHeaderCode extends StatelessWidget {
  const SharedHomeHeaderCode({
    super.key,
    required this.asset,
    required this.text,
  });
  final String asset;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSVGImage(asset: asset),
        8.vs,
        Text(text, style: getRegularTextStyle(fontSize: 14)),
      ],
    );
  }
}
