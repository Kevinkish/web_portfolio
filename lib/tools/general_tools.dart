import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_portfolio/state%20management/cubit.dart';

MainBloc cubit(context) => MainBloc.get(context);

double sizeHeight(context) => MediaQuery.sizeOf(context).height;

double sizeWidth(context) => MediaQuery.sizeOf(context).width;

ThemeData theme(context) => Theme.of(context);

double pagesHeight(context) => (sizeHeight(context) - kToolbarHeight);

appPadding(context) => sizeWidth(context) * 0.06;

Duration onHoverLongAnimationDuration() => const Duration(milliseconds: 500);
Duration onHoverShortAnimationDuration() => const Duration(milliseconds: 200);

bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width >= 600;
bool isMobile(BuildContext context) =>
    MediaQuery.sizeOf(context).width < 600 ||
    // ignore: unrelated_type_equality_checks
    MediaQuery.of(context).orientation == DeviceOrientation.portraitUp;
bool isHeightRediuced(BuildContext context) =>
    MediaQuery.sizeOf(context).height < 584;

int delayedAnimationDuration = 000;
//GESTURE ICONButton
GestureDetector gestureButton({
  dynamic padding = const EdgeInsets.all(8),
  bool enableTrialColor = true,
  void Function()? tapAction,
  Widget? child,
}) {
  return GestureDetector(
    onTap: tapAction,
    child: Container(
      color: enableTrialColor ? Colors.red : Colors.transparent,
      padding: padding,
      child: child,
    ),
  );
}
