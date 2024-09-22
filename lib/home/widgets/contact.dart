import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:web_portfolio/animation/animation.dart';
import 'package:web_portfolio/home/home_page.dart';
import 'package:web_portfolio/home/widgets/home.dart';
import 'package:web_portfolio/home/widgets/tools.dart';
import 'package:web_portfolio/tools/colors.dart';
import 'package:web_portfolio/tools/general_tools.dart';

Container contactPage({dynamic context, GlobalKey? key}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: appPadding(context)),
    color: Colors.transparent,
    width: sizeWidth(context),
    key: key!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cubit(context).selectedPage == 3 ||
                scrollPosition > pagesHeight(context) * 5 / 2
            ? DelayedAnimation(
                delay: delayedAnimationDuration,
                child: Text(
                  "Get in touch",
                  style: theme(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.tdBlack, fontSize: 21),
                ),
              )
            : Container(),
        const Gap(7),
        cubit(context).selectedPage == 3 ||
                scrollPosition > pagesHeight(context) * 5 / 2
            ? DelayedAnimation(
                delay: delayedAnimationDuration,
                child: const Text(
                  textAlign: TextAlign.center,
                  "Do you have a project in your mind, contact me here.",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : Container(),
        const Gap(65),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //LEFT CONTAINER WITH MOUSE REGION
                Expanded(
                  flex: 1,
                  child: cubit(context).selectedPage == 3 ||
                          scrollPosition >
                              pagesHeight(context) * 5 / 2
                      ? DelayedAnimation(
                          fromLeft: true,
                          delay: delayedAnimationDuration,
                          child: SizedBox(
                            height: sizeHeight(context) * 0.55,
                            child: Stack(
                              children: [
                                //FIRST CONTAINER
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.tdWhite,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10,
                                          offset: Offset(3, 5),
                                        ),
                                      ]),
                                ),

                                //SECOND CONTAINER
                                AnimatedContainer(
                                  curve: Curves.easeInOut,
                                  height: cubit(context).onContact
                                      ? 0
                                      : sizeHeight(context) * 0.55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: const Radius.circular(12),
                                        bottom: Radius.circular(
                                            cubit(context).onContact ? 0 : 12)),
                                    color: AppColors.tdBlue,
                                  ),
                                  duration: onHoverLongAnimationDuration(),
                                ),

                                //THIRD CONTAINER
                                MouseRegion(
                                  onHover: (event) {
                                    cubit(context).hoverOnContact(true);
                                  },
                                  onExit: (event) {
                                    cubit(context).hoverOnContact(false);
                                  },
                                  child: contactsDetailsContainer(
                                      context: context,
                                      putShadow: false,
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Find me",
                                            style: theme(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: cubit(context)
                                                            .onContact
                                                        ? AppColors.tdBlack
                                                        : AppColors.tdWhite),
                                          ),
                                          const Gap(20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                  size: 16,
                                                  color:
                                                      cubit(context).onContact
                                                          ? AppColors.tdBlack
                                                          : AppColors.tdWhite,
                                                  Icons.mail_outline_rounded),
                                              const Gap(10),
                                              Expanded(
                                                child: Text(
                                                    "Email: kevinkish117@gmail.com",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: cubit(context)
                                                                .onContact
                                                            ? AppColors.tdBlack
                                                            : AppColors.tdWhite,
                                                        fontSize: 12)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                  size: 16,
                                                  color:
                                                      cubit(context).onContact
                                                          ? AppColors.tdBlack
                                                          : AppColors.tdWhite,
                                                  MingCute.phone_line),
                                              const Gap(10),
                                              Expanded(
                                                child: Text(
                                                    "Tel: +243 991 617 472",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: cubit(context)
                                                                .onContact
                                                            ? AppColors.tdBlack
                                                            : AppColors.tdWhite,
                                                        fontSize: 12)),
                                              )
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ),
                isMobile(context)
                    ? Container()
                    : Gap(sizeWidth(context) * 0.02),

                //RIGHT CONTAINER
                isMobile(context)
                    ? Container()
                    : Expanded(
                        flex: 1,
                        child: cubit(context).selectedPage == 3 ||
                                scrollPosition >
                                    pagesHeight(context) *
                                        5 /
                                        2
                            ? DelayedAnimation(
                                fromRight: true,
                                delay: delayedAnimationDuration,
                                child: idsContainer(context))
                            : Container()),
              ],
            ),
            Gap(sizeHeight(context) * 0.02),
            isMobile(context)
                ? Container()
                : Row(
                    children: [
                      Expanded(flex: 1, child: Container()),
                      isMobile(context)
                          ? Container()
                          : Gap(sizeWidth(context) * 0.02),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            cubit(context).selectedPage == 3 ||
                                    scrollPosition >
                                        pagesHeight(context) *
                                            5 /
                                            2
                                ? DelayedAnimation(
                                    fromRight: true,
                                    delay: delayedAnimationDuration,
                                    child: sendBtn(context))
                                : Container(),
                            Container()
                          ],
                        ),
                      ),
                    ],
                  )
          ],
        ),
        isMobile(context)
            ? cubit(context).selectedPage == 3 ||
                    scrollPosition >
                        pagesHeight(context) * 5 / 2
                ? DelayedAnimation(
                    fromRight: true,
                    delay: delayedAnimationDuration,
                    child: idsContainer(context))
                : Container()
            : Container(),
        isMobile(context) ? Gap(sizeHeight(context) * 0.02) : Container(),
        isMobile(context)
            ? cubit(context).selectedPage == 3 ||
                    scrollPosition >
                        pagesHeight(context) * 5 / 2
                ? DelayedAnimation(
                    fromLeft: true,
                    delay: delayedAnimationDuration,
                    child: sendBtn(context))
                : Container()
            : Container(),
        Gap(sizeHeight(context) * 0.15),
        Text("Kevin Kish .",
            style: theme(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.tdBlack)),
        Gap(sizeHeight(context) * 0.04),
        SizedBox(
          height: 50,
          child: selectorListView(context: context),
        ),
        Gap(sizeHeight(context) * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            referenceCircle(icon: MingCute.facebook_line),
            Gap(sizeWidth(context) * 0.02),
            referenceCircle(icon: MingCute.linkedin_line),
            Gap(sizeWidth(context) * 0.02),
            referenceCircle(icon: MingCute.basketball_line),
            Gap(sizeWidth(context) * 0.02),
            referenceCircle(icon: MingCute.github_line),
          ],
        ),
        Gap(sizeHeight(context) * 0.05),
        const SelectableText(
          "Copyright ©️ Kevin Kish - All rights reserved",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Gap(sizeHeight(context) * 0.05),
      ],
    ),
  );
}

MouseRegion sendBtn(context) {
  return MouseRegion(
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
              borderRadius: BorderRadius.circular(12),
              color: cubit(context).onAbout
                  ? AppColors.tdDarkBlue
                  : AppColors.tdBlue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Send  ",
                style: TextStyle(
                    color: AppColors.tdWhite,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                MingCute.send_plane_line,
                color: AppColors.tdWhite,
              )
            ],
          )));
}

Container idsContainer(context) {
  return Container(
    color: Colors.transparent,
    height: sizeHeight(context) * 0.55,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: inputTextField(text: "Name")),
            ),
            Gap(sizeWidth(context) * 0.005),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: inputTextField(text: "Email")),
            ),
          ],
        ),
        Gap(sizeHeight(context) * 0.01),
        Expanded(
          // flex: 9,
          child: Container(
              width: sizeWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: inputTextField(text: "Message")),
        ),
      ],
    ),
  );
}

TextField inputTextField({String? text}) {
  return TextField(
    style: TextStyle(
        color: AppColors.tdBlack, fontSize: 12, fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: text!,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12)),
  );
}

Container contactsDetailsContainer(
    {dynamic context,
    dynamic child,
    Color? color = Colors.blue,
    bool putShadow = true}) {
  return Container(
      height: sizeHeight(context) * 0.55,
      padding: EdgeInsets.symmetric(
          horizontal: sizeWidth(context) * 0.05,
          vertical: sizeHeight(context) * 0.03),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: putShadow
              ? const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(3, 5),
                  ),
                ]
              : null),
      child: child!);
}
