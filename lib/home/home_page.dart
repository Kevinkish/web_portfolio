import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_portfolio/home/widgets/about.dart';
import 'package:web_portfolio/home/widgets/contact.dart';
import 'package:web_portfolio/home/widgets/home.dart';
import 'package:web_portfolio/home/widgets/projects.dart';
import 'package:web_portfolio/state%20management/cubit.dart';
import 'package:web_portfolio/state%20management/state.dart';
import 'package:web_portfolio/tools/general_tools.dart';

GlobalKey containerKey0 = GlobalKey();
GlobalKey containerKey1 = GlobalKey();
GlobalKey containerKey2 = GlobalKey();
GlobalKey containerKey3 = GlobalKey();

void resetToTop(index) {
  Scrollable.ensureVisible(
    index == 0
        ? containerKey0.currentContext!
        : index == 1
            ? containerKey1.currentContext!
            : index == 2
                ? containerKey2.currentContext!
                : index == 3
                    ? containerKey3.currentContext!
                    : containerKey0.currentContext!,
    duration: const Duration(milliseconds: 500),
    curve: Curves.decelerate,
  );
}

List navigationList = ["Home", "About", "Projects", "Contact"];

final ScrollController scrollController = ScrollController();
double scrollPosition = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() async {
      scrollPosition = scrollController.offset;
      // print('Position actuelle du scroll : ${scrollController.offset}');


      scrollController.offset < pagesHeight(context) &&
             
              isMobile(context) == false
          ? cubit(context).navigationChanged(0)
          : scrollController.offset < pagesHeight(context) * 2 &&
                 
                  isMobile(context) == false
              ? cubit(context).navigationChanged(1)
              : scrollController.offset < pagesHeight(context) * 3 &&
                     
                      sizeWidth(context) > 700
                  ? cubit(context).navigationChanged(2)
                  : scrollController.offset < pagesHeight(context) * 4 &&
                         
                          sizeWidth(context) > 700
                      ? cubit(context).navigationChanged(3)
                      : null;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            endDrawer: isMobile(context)
                ? Drawer(
                    width: sizeWidth(context) * 0.3,
                    child: Padding(
                      padding: EdgeInsets.all(sizeWidth(context) * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.grid_view_rounded),
                          selectorListView(context: context, isDrawer: true),
                        ],
                      ),
                    ),
                  )
                : null,
            appBar: AppBar(
              actionsIconTheme: const IconThemeData.fallback(),
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              // elevation: 1,
              shadowColor: Colors.black38,
              flexibleSpace: topTexts(context),
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  homePage(context: context, key: containerKey0),
                  aboutPage(context: context, key: containerKey1),
                  projectPage(context: context, key: containerKey2),
                  contactPage(context: context, key: containerKey3),
                ],
              ),
            ),
          );
        });
  }
}
