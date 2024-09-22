import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:web_portfolio/animation/animation.dart';
import 'package:web_portfolio/home/home_page.dart';
import 'package:web_portfolio/tools/colors.dart';
import 'package:web_portfolio/tools/general_tools.dart';

Container projectPage({dynamic context, GlobalKey? key}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: appPadding(context)),
    color: Colors.transparent,
    width: sizeWidth(context),
    height: isHeightRediuced(context) || sizeWidth(context) < 700
        ? null
        : sizeHeight(context) - kToolbarHeight,
    key: key!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cubit(context).selectedPage == 2 || scrollPosition > (sizeHeight(context) - kToolbarHeight) * 3 / 2
            ? DelayedAnimation(
                delay: delayedAnimationDuration,
                child: Text(
                  "Projects",
                  style: theme(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.tdBlack, fontSize: 21),
                ),
              )
            : Container(),
        const Gap(65),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //LEFT CONTAINER
            Expanded(
              flex: 1,
              child: cubit(context).selectedPage == 2 || scrollPosition >
                      (sizeHeight(context) - kToolbarHeight) * 3 / 2
                  ? DelayedAnimation(
                      delay: delayedAnimationDuration,
                      child: projectDetailsContainer(
                          cubitBoolean: cubit(context).onProject0,
                          cubitMethod: cubit(context).hoveronProject0,
                          context: context,
                          icon: Icons.work_outline_rounded,
                          text1: "Completed",
                          text2: "15+ Finished projects"),
                    )
                  : Container(),
            ),
            sizeWidth(context) < 700
                ? Container()
                : Gap(sizeWidth(context) * 0.05),
            sizeWidth(context) < 700
                ? Container()
                : Expanded(
                    flex: 1,
                    child: cubit(context).selectedPage == 2 || scrollPosition >
                            (sizeHeight(context) - kToolbarHeight) * 3 / 2
                        ? DelayedAnimation(
                            delay: delayedAnimationDuration + 100,
                            child: middleProjects(context))
                        : Container(),
                  ),
            sizeWidth(context) < 700
                ? Container()
                : Gap(sizeWidth(context) * 0.05),
            sizeWidth(context) < 700
                ? Container()
                : Expanded(
                    flex: 1,
                    child: cubit(context).selectedPage == 2 || scrollPosition >
                            (sizeHeight(context) - kToolbarHeight) * 3 / 2
                        ? DelayedAnimation(
                            delay: delayedAnimationDuration + 200,
                            child: rightProjects(context),
                          )
                        : Container(),
                  ),
          ],
        ),
        sizeWidth(context) < 700 ? const Gap(20) : Container(),
        sizeWidth(context) < 700
            ? Row(
                children: [
                  Expanded(
                    child: cubit(context).selectedPage == 2 || scrollPosition >
                            (sizeHeight(context) - kToolbarHeight) * 3 / 2
                        ? DelayedAnimation(
                            delay: delayedAnimationDuration + 100,
                            child: middleProjects(context),
                          )
                        : Container(),
                  ),
                ],
              )
            : Container(),
        sizeWidth(context) < 700 ? const Gap(20) : Container(),
        sizeWidth(context) < 700
            ? Row(
                children: [
                  Expanded(
                    child: DelayedAnimation(
                      delay: delayedAnimationDuration + 200,
                      child: rightProjects(context),
                    ),
                  ),
                ],
              )
            : Container(),
        sizeWidth(context) < 700
            ? Gap(sizeHeight(context) * 0.15)
            : Container(),
      ],
    ),
  );
}

SizedBox projectDetailsContainer({
  dynamic cubitMethod,
  bool cubitBoolean = false,
  dynamic context,
  IconData? icon,
  String? text1,
  String? text2,
  Color? color = Colors.transparent,
}) {
  return SizedBox(
    height: sizeHeight(context) * 0.4,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.tdWhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(3, 5),
                )
              ]),
        ),
        AnimatedContainer(
          curve: Curves.easeInOut,
          height: cubitBoolean ? sizeHeight(context) : 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                bottom: const Radius.circular(12),
                top: Radius.circular(cubitBoolean ? 12 : 0)),
            color: Colors.blue,
          ),
          duration: onHoverLongAnimationDuration(),
        ),
        MouseRegion(
            onHover: (event) {
              cubitMethod(true);
            },
            onExit: (event) {
              cubitMethod(false);
            },
            child: Container(
              height: sizeHeight(context) * 0.4,
              padding: EdgeInsets.symmetric(
                  horizontal: sizeWidth(context) * 0.05,
                  vertical: sizeHeight(context) * 0.03),
              decoration: BoxDecoration(
                color: color!,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Gap(0),
                  Icon(
                    icon!,
                    color: cubitBoolean ? AppColors.tdWhite : AppColors.tdBlue,
                    size: 60,
                  ),
                  const Gap(0),
                  Text(
                    textAlign: TextAlign.center,
                    text1!,
                    style: theme(context).textTheme.titleMedium!.copyWith(
                        color: cubitBoolean
                            ? AppColors.tdWhite
                            : AppColors.tdBlack),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    text2!,
                    style: TextStyle(
                      fontSize: 12,
                      color: cubitBoolean ? AppColors.tdWhite : Colors.grey,
                    ),
                  )
                ],
              ),
            )),
      ],
    ),
  );
}

rightProjects(context) {
  return projectDetailsContainer(
      cubitBoolean: cubit(context).onProject2,
      cubitMethod: cubit(context).hoveronProject2,
      context: context,
      icon: Icons.workspace_premium_outlined,
      text1: "Experience",
      text2: "7+ Years in the field");
}

middleProjects(context) {
  return projectDetailsContainer(
      cubitBoolean: cubit(context).onProject1,
      cubitMethod: cubit(context).hoveronProject1,
      context: context,
      icon: MingCute.group_line,
      text1: "Clients",
      text2: "24+ Happy Clients");
}
