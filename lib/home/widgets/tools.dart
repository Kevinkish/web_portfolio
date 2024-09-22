import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:web_portfolio/home/home_page.dart';
import 'package:web_portfolio/tools/colors.dart';
import 'package:web_portfolio/tools/general_tools.dart';

GestureDetector navigationGestureBtn(
    {dynamic context, String? text, int? index, bool isDrawer = false}) {
  double pagesHeight = (sizeHeight(context) - kToolbarHeight);
  return GestureDetector(
      onTap: () {
        index == 0 &&
                isHeightRediuced(context) == false &&
                isMobile(context) == false
            ? scrollController.offset == pagesHeight
            : index == 1 &&
                    isHeightRediuced(context) == false &&
                    isMobile(context) == false
                ? scrollController.offset == pagesHeight * 2
                : index == 2 &&
                        isHeightRediuced(context) == false &&
                        sizeWidth(context) > 700
                    ? scrollController.offset == pagesHeight * 3
                    : index == 4
                        ? scrollController.offset == pagesHeight * 4
                        : cubit(context).navigationChanged(index!);
        // index==1?
        // scrollController.offset == pagesHeight:index==2?
        // cubit(context).navigationChanged(index!);
        cubit(context).animate(true);
        resetToTop(index);
        isDrawer ? Navigator.pop(context) : null;
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Text(
              text!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: cubit(context).selectedPage == index
                      ? AppColors.tdMallow
                      : AppColors.tdBlack),
            ),
            cubit(context).selectedPage == index ? const Gap(4) : Container(),
            cubit(context).selectedPage == index
                ? CircleAvatar(
                    maxRadius: 2,
                    backgroundColor: AppColors.tdMallow,
                  )
                : Container()
          ],
        ),
      ));
}

Container roundedContainerBtn(
    {dynamic context, Widget? child, Color? color, double? radiusValue = 7}) {
  return Container(
      decoration: BoxDecoration(
          color: color!, borderRadius: BorderRadius.circular(radiusValue!)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      child: child!);
}

MouseRegion referenceCircle({dynamic icon}) {
  return MouseRegion(
    child: Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: AppColors.tdWhite,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, blurRadius: 3, offset: Offset(0, 2))
          ]),
      child: Icon(
        icon,
        size: 20,
      ),
    ),
  );
}
