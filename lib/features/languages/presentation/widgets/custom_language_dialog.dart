

import '../../../../exports.dart';
import '../../data/static/static.dart';
import '../manager/language_cubit.dart';

class CustomLanguageDialog extends StatefulWidget {
  final Function(bool isEnglish) onChange;
  const CustomLanguageDialog({required this.onChange,super.key});

  @override
  State<CustomLanguageDialog> createState() => _CustomLanguageDialogState();
}

class _CustomLanguageDialogState extends State<CustomLanguageDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,

      child: RadioGroup<bool>(
        groupValue: context.read<LanguageCubit>().isEn,
        onChanged: (value) {
       widget.onChange.call(value!);

          setState(() {});
          pop();
        },
        child: ListView.separated(
          itemCount: languages.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            children: [
              Radio<bool>(
                value: languages[index].isSelected!,
                toggleable: true,

                activeColor: AppColors.primaryColor,
                side: BorderSide(width: 2.h, color: AppColors.darkGray),
              ),
              14.hs,
              CustomPngImage(image: languages[index].image!),
              8.hs,
              Text(languages[index].name.trans, style: getMediumTextStyle(fontSize: 20.sp)),
            ],
          ),
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: width,
            child: Divider(height: 22.h, color: AppColors.black.withValues(alpha: 0.4)),
          ),
        ),
      ),
    );
  }
}
