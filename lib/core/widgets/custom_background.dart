// ignore_for_file: must_be_immutable

import 'package:x_deal/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:x_deal/features/bottom_navigation/presentation/widget/bottom_navigation_widget.dart';
import 'package:x_deal/features/languages/presentation/manager/language_cubit.dart';

import '../../exports.dart';
import '../../features/bottom_navigation/data/static/bottom_nav_bar_static.dart';
import 'custom_floating_action_button.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  final Color? statusBarColor;
  final bool extendBody;
  final IconData? icon;
  final String? title;
  final TextStyle? style;
  final double? iconSize;
  final bool showBack;
  Widget? drawer;
  Widget? floatingActionButton;
  final bool showSafeArea;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final bool showAppbar;
  final Key? scaffoldKey;
  PreferredSizeWidget? appBar;
  Widget? bottomNavRoute;
  final bool showNavBar;
  CustomBackground({
    required this.child,
    this.iconSize,
    this.title,
    this.style,
    this.icon,
    this.bottomNavRoute,
    this.appBar,
    this.drawer,
    this.extendBody = false,
    this.showBack = false,
    this.showAppbar = false,
    this.showSafeArea = true,
    this.backgroundColor,
    this.appBarBackgroundColor,
    this.showNavBar = false,
    this.floatingActionButton,
    this.scaffoldKey,
    this.statusBarColor = AppColors.transparent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,

        statusBarBrightness: statusBarColor.isEqualTo(AppColors.white)
            ? Brightness.dark
            : null,
        statusBarIconBrightness:
            statusBarColor.isEqualTo(AppColors.white) ||
                statusBarColor.isEqualTo(AppColors.transparent)
            ? Brightness.dark
            : Brightness.light,
      ),
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer,

        // floatingActionButton: showNavBar
        //     ? CustomFloatingActionButton()
        //     : floatingActionButton,
        bottomNavigationBar: showNavBar
            ? BlocBuilder<LanguageCubit, CubitStates>(
                builder: (context, state) => BottomNavigationWidget(),
              )
            : null,
        backgroundColor: backgroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: true,
        appBar: title.isNotNull
            ? AppBar(
                backgroundColor: appBarBackgroundColor ?? AppColors.white,
                toolbarHeight: 80.h,
                title: Text(
                  title!,
                  style: getSemiBoldTextStyle(
                    fontSize: 24.sp,
                    color: AppColors.white,
                  ),
                ),
                centerTitle: true,
                iconTheme: IconThemeData(color: AppColors.white),
              )
            : showAppbar
            ? appBar
            : null,

        extendBody: extendBody,
        body: buildChild,
      ),
    );
  }

  Widget? get buildChild => showSafeArea.isTrueGetWidgetOrAnotherWidget(
    SafeArea(child: child),
    child,
  );
}
