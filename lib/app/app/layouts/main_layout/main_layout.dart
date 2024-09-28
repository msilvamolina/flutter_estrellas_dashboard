import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/main_controller.dart';
import 'components/drawer_content.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    this.appBarTitle,
    this.floatingActionButton,
    required this.currentRoute,
    required this.child,
    super.key,
  });
  final Widget child;
  final String? appBarTitle;
  final Widget? floatingActionButton;
  final String currentRoute;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTinyPhone = screenWidth < 320;
    bool isMobile = screenWidth < 480;
    bool isTablet = screenWidth < 740;
    bool isTablet2 = screenWidth < 890;
    bool isDesktop = screenWidth > 720;

    return Scaffold(
      floatingActionButton: floatingActionButton,
      drawer: isTablet2
          ? Drawer(
              child: DrawerContent(
                isMobile: true,
                currentRoute: currentRoute,
              ),
            )
          : null,
      appBar: !isTablet2
          ? AppBar(
              toolbarHeight: 70,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: mainController.changeThemeColor,
                  icon: const Icon(Icons.color_lens),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
              title: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/fulllogo.svg',
                      height: 40,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : AppBar(
              title: appBarTitle != null
                  ? Text(appBarTitle!)
                  : SvgPicture.asset(
                      'assets/svg/fulllogo.svg',
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
      body: Row(
        children: [
          if (!isTablet2)
            Container(
              width: 240,
              child: DrawerContent(
                currentRoute: currentRoute,
                isMobile: false,
              ),
            ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
