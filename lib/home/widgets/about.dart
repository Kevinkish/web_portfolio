import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:web_portfolio/animation/animation.dart';
import 'package:web_portfolio/home/home_page.dart';
import 'package:web_portfolio/tools/colors.dart';
import 'package:web_portfolio/tools/general_tools.dart';

Container aboutPage({dynamic context, GlobalKey? key}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: appPadding(context)),
    color: Colors.transparent,
    width: sizeWidth(context),
    height: isHeightRediuced(context) || isMobile(context)
        ? null
        : sizeHeight(context) - kToolbarHeight,
    key: key!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cubit(context).selectedPage == 1 ||
                scrollPosition > (sizeHeight(context) - kToolbarHeight) / 3
            ? DelayedAnimation(
                delay: delayedAnimationDuration,
                child: Text(
                  "About me",
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
          children: [
            //LEFT CONTAINER
            Expanded(
              flex: 1,
              child: cubit(context).selectedPage == 1 ||
                      scrollPosition >
                          (sizeHeight(context) - kToolbarHeight) / 3
                  ? DelayedAnimation(
                      fromLeft: true,
                      delay: delayedAnimationDuration,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeWidth(context) * 0.03,
                            vertical: sizeHeight(context) * 0.03),
                        decoration: BoxDecoration(
                            color: AppColors.tdWhite,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(3, 5),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Text("My introduction",
                                style: theme(context).textTheme.titleMedium),
                            const Gap(15),
                            const Text(
                              textAlign: TextAlign.center,
                              "I am well-versed in FLUTTER and DART, and other cutting edge technologies and tools, which allows me to implement interactive features. Additionally, I have experience working with content management systems (CMS) like WordPres",
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: isDesktop(context)
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.center,
                              children: [
                                MouseRegion(
                                  onHover: (event) {
                                    cubit(context).hoveronAbout(true);
                                  },
                                  onExit: (event) {
                                    cubit(context).hoveronAbout(false);
                                  },
                                  child: AnimatedContainer(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 13,
                                    ),
                                    duration: onHoverShortAnimationDuration(),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: cubit(context).onAbout
                                            ? AppColors.tdDarkMallow
                                            : AppColors.tdMallow),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Download CV",
                                          style: TextStyle(
                                              color: AppColors.tdWhite,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Gap(10),
                                        Icon(
                                          MingCute.download_2_line,
                                          size: 18,
                                          color: AppColors.tdWhite,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
            Gap(sizeWidth(context) * 0.03),

            //RIGHT CONTAINER
            isMobile(context)
                ? Container()
                : Expanded(
                    flex: 1,
                    child: cubit(context).selectedPage == 1 ||
                            scrollPosition >
                                (sizeHeight(context) - kToolbarHeight) / 3
                        ? DelayedAnimation(
                            fromRight: true,
                            delay: delayedAnimationDuration,
                            child: rightRowDatas(context),
                          )
                        : Container(),
                  ),
          ],
        ),
        const Gap(20),
        cubit(context).selectedPage == 1 && isMobile(context) ||
                isMobile(context) &&
                    scrollPosition > (sizeHeight(context) - kToolbarHeight) / 3
            ? DelayedAnimation(
                fromRight: true,
                delay: delayedAnimationDuration,
                child: rightRowDatas(context))
            : Container(),
        isHeightRediuced(context) || isMobile(context)
            ? Gap(sizeHeight(context) * 0.05)
            : Container()
      ],
    ),
  );
}

Row rightRowDatas(context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //FRONTEND
      frontendDatass(context),

      //BACKEND
      sizeWidth(context) < 900 && isMobile(context) == false
          ? Container()
          : backendDatass(context),

      //DATABASE
      sizeWidth(context) < 980 && isMobile(context) == false
          ? Container()
          : Expanded(child: databaseDatass(context))
    ],
  );
}

Column databaseDatass(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Database",
        style: theme(context).textTheme.titleMedium,
      ),
      const Gap(20),
      Row(
        children: [choiceContainer(text: "MySQL")],
      ),
      Row(
        children: [choiceContainer(text: "VBA")],
      ),
      Row(
        children: [choiceContainer(text: "MongoDB")],
      ),
    ],
  );
}

Column backendDatass(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Backend",
        style: theme(context).textTheme.titleMedium,
      ),
      const Gap(20),
      Row(
        children: [
          choiceContainer(text: "PHP"),
          choiceContainer(text: "JAVA"),
        ],
      ),
      Row(
        children: [choiceContainer(text: "PYTHON")],
      ),
      Row(
        children: [choiceContainer(text: "C++")],
      ),
    ],
  );
}

Column frontendDatass(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Frontend",
        style: theme(context).textTheme.titleMedium,
      ),
      const Gap(20),
      Row(
        children: [
          choiceContainer(text: "FLUTTER"),
          choiceContainer(text: "DART"),
          choiceContainer(text: "FIREBASE"),
        ],
      ),
      Row(
        children: [
          choiceContainer(text: "JAVA"),
          choiceContainer(text: "PHOTOSHOP"),
          choiceContainer(text: "PYTHON"),
        ],
      ),
      Row(
        children: [
          choiceContainer(text: "VISUAL BASIC"),
        ],
      ),
      sizeWidth(context) < 900 && isMobile(context) == false
          ? const Gap(10)
          : Container(),
      sizeWidth(context) < 900 && isMobile(context) == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backendDatass(context),
                databaseDatass(context),
              ],
            )
          : Container(),
    ],
  );
}

Container choiceContainer({String? text}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 0, 4, 4),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: AppColors.tdMallow, borderRadius: BorderRadius.circular(7)),
    child: Text(
      text!,
      style: TextStyle(fontSize: 12, color: AppColors.tdWhite),
    ),
  );
}
