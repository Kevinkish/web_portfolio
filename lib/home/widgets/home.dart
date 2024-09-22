import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:web_portfolio/animation/animation.dart';
import 'package:web_portfolio/home/home_page.dart';
import 'package:web_portfolio/home/widgets/tools.dart';
import 'package:web_portfolio/tools/colors.dart';
import 'package:web_portfolio/tools/general_tools.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

topTexts(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: sizeWidth(context) * 0.06),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Kish',
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColors.mainBlue, fontSize: 30),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: sizeHeight(context) * 0.015,
                  left: sizeWidth(context) * 0.006),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  color: AppColors.tdBlack, shape: BoxShape.circle),
            )
          ],
        ),

        //LIST
        isDesktop(context) ? selectorListView(context: context) : Container(),
        isDesktop(context)
            ? MouseRegion(
                onHover: (event) {
                  cubit(context).hoveronHome0(true);
                },
                onExit: (event) {
                  cubit(context).hoveronHome0(false);
                },
                child: AnimatedContainer(
                  duration: onHoverShortAnimationDuration(),
                  curve: Curves.decelerate,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: cubit(context).onHome0
                          ? Colors.blue
                          : AppColors.tdGrey),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Download CV",
                        style: theme(context).textTheme.labelMedium!.copyWith(
                            color: cubit(context).onHome0
                                ? AppColors.tdWhite
                                : AppColors.tdBlack,
                            fontWeight: FontWeight.bold),
                      ),
                      const Gap(10),
                      Icon(
                        Icons.feed_rounded,
                        size: 18,
                        color: cubit(context).onHome0
                            ? AppColors.tdWhite
                            : AppColors.tdBlack,
                      )
                    ],
                  ),
                ),
              )
            : Container(),
        // gestureButton(
        //     tapAction: () => Scaffold.of(context).openDrawer(),
        //     child: const Icon(Icons.menu_rounded),
        //     enableTrialColor: false,
        //     padding: const EdgeInsets.fromLTRB(8, 8, 0, 8)),
      ],
    ),
  );
}

ListView selectorListView({dynamic context, bool isDrawer = false}) {
  return ListView.builder(
      shrinkWrap: true,
      itemExtent: sizeWidth(context) * 0.09,
      scrollDirection: isDrawer ? Axis.vertical : Axis.horizontal,
      itemCount: navigationList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            navigationGestureBtn(
                isDrawer: isDrawer,
                context: context,
                text: navigationList[index],
                index: index),
          ],
        );
      });
}

Column presentationMethod(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DelayedAnimation(
        delay: delayedAnimationDuration + 100,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: AppColors.tdYellowB,
              borderRadius: BorderRadius.circular(3)),
          child: Text(
            'Kevin Kish',
            style: theme(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.tdWhite),
          ),
        ),
      ),
      const Gap(20),
      DelayedAnimation(
        delay: delayedAnimationDuration + 200,
        child: Row(
          children: [
            Text(
              "I'm ",
              style: theme(context).textTheme.headlineLarge,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Developer',
                  cursor: "|",
                  textStyle: theme(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.mainBlue),
                  speed: const Duration(milliseconds: 200),
                ),
                TypewriterAnimatedText(
                  'Designer',
                  cursor: "|",
                  textStyle: theme(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.mainBlue),
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              repeatForever: true,
            ),
          ],
        ),
      ),
      const Gap(30),
      DelayedAnimation(
        delay: delayedAnimationDuration + 300,
        child: const Text(
          "Experienced frontend developer with a passion for creating visually stunning and user-friendly websites.",
        ),
      ),
      const Gap(20),
      DelayedAnimation(
        delay: delayedAnimationDuration + 400,
        child: Row(
          mainAxisAlignment: isMobile(context)
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Expanded(
              flex: isMobile(context) ? 1 : 0,
              child: roundedContainerBtn(
                  context: context,
                  child: Center(
                    child: Text(
                      "Hire Me",
                      style: theme(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.tdWhite),
                    ),
                  ),
                  color: AppColors.tdMallow),
            ),
            const Gap(15),
            Expanded(
              flex: isMobile(context) ? 1 : 0,
              child: MouseRegion(
                onHover: (event) {
                  cubit(context).hoveronHome1(true);
                },
                onExit: (event) {
                  cubit(context).hoveronHome1(false);
                },
                child: AnimatedContainer(
                  duration: onHoverShortAnimationDuration(),
                  curve: Curves.decelerate,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: cubit(context).onHome1
                          ? AppColors.tdBlue
                          : AppColors.tdGrey),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Download CV",
                          style: theme(context).textTheme.titleSmall!.copyWith(
                              color: cubit(context).onHome1
                                  ? AppColors.tdWhite
                                  : AppColors.tdBlack),
                        ),
                      ),
                      const Gap(10),
                      Icon(
                        color: cubit(context).onHome1
                            ? AppColors.tdWhite
                            : AppColors.tdBlack,
                        Icons.feed_rounded,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      const Gap(50),
      DelayedAnimation(
        delay: delayedAnimationDuration + 500,
        child: Row(
          mainAxisAlignment: isMobile(context)
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.start,
          children: [
            referenceCircle(icon: MingCute.facebook_fill),
            const Gap(30),
            referenceCircle(icon: MingCute.church_line),
            const Gap(30),
            referenceCircle(icon: MingCute.facebook_line),
            const Gap(30),
            referenceCircle(icon: Icons.tiktok),
          ],
        ),
      ),
    ],
  );
}

homePage({dynamic context, GlobalKey? key}) {
  return Container(
    key: key,
    width: sizeWidth(context),
    color: Colors.transparent,
    height: isHeightRediuced(context) || isMobile(context)
        ? null
        : sizeHeight(context) - kToolbarHeight,
    padding: EdgeInsets.symmetric(horizontal: sizeWidth(context) * 0.075),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isMobile(context)
            ? DelayedAnimation(
                delay: delayedAnimationDuration, child: topImage(context))
            : Container(),
        const Gap(40),
        Row(
          children: [
            Expanded(child: presentationMethod(context)),
            isDesktop(context) ? Gap(sizeWidth(context) * 0.1) : Container(),
            isDesktop(context)
                ? DelayedAnimation(
                    delay: delayedAnimationDuration, child: topImage(context))
                : Container()
          ],
        ),

        //SCROLL DOWN BUTTON
        Column(
           mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                cubit(context).navigationChanged(1);
                resetToTop(1);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.tdWhite,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 3))
                    ]),
                child: SizedBox(
                  height:25,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      const Icon(MingCute.mouse_line),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Scroll down",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style:
                                theme(context).textTheme.titleSmall!.copyWith(
                                      color: AppColors.tdBlack,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    
        isHeightRediuced(context) || isMobile(context)
            ? Gap(sizeHeight(context) * 0.05)
            : Container()
      ],
    ),
  );
}

Container topImage(context) {
  return Container(
    height: isMobile(context)
        ? sizeHeight(context) * 0.4
        : sizeHeight(context) * 0.5,
    width: isMobile(context) ? null : sizeWidth(context) * 0.25,
    decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image:
                AssetImage("images/PXL_20240108_103201371.NIGHT~2 (2).jpg"))),
  );
}
