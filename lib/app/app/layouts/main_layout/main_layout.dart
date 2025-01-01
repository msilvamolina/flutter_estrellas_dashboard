import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/responsive.dart';
import '../../controllers/main_controller.dart';
import 'components/drawer_content.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    required this.currentRoute,
    required this.child,
    this.appBarTitle,
    this.appBarWidget,
    this.floatingActionButton,
    this.appBarActions,
    this.mainCurrentRoute,
    this.maxWidth,
    this.bottomNavigationBar,
    this.showMenu = true,
    super.key,
  });
  final Widget child;
  final Widget? bottomNavigationBar;
  final String? appBarTitle;
  final Widget? appBarWidget;
  final Widget? floatingActionButton;
  final String currentRoute;
  final String? mainCurrentRoute;
  final double? maxWidth;
  final bool showMenu;
  final List<Widget>? appBarActions;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      drawer: Responsive.isTablet2(context)
          ? showMenu
              ? Drawer(
                  child: DrawerContent(
                    isMobile: true,
                    currentRoute: currentRoute,
                    mainCurrentRoute: mainCurrentRoute,
                  ),
                )
              : null
          : null,
      appBar: !Responsive.isTablet2(context)
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
                    if (appBarWidget != null)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: appBarWidget!,
                        ),
                      )
                    else if (appBarTitle != null) ...[
                      Spacer(),
                      Text(
                        appBarTitle!,
                        style: TypographyStyle.bodyBlackLarge,
                      ),
                      Spacer(),
                    ],
                  ],
                ),
              ),
            )
          : AppBar(
              title: appBarWidget != null
                  ? appBarWidget!
                  : appBarTitle != null
                      ? Text(
                          appBarTitle!,
                          style: TypographyStyle.bodyBlackLarge,
                        )
                      : SvgPicture.asset(
                          'assets/svg/fulllogo.svg',
                          height: 30,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                        ),
              actions: appBarActions,
            ),
      body: Row(
        children: [
          if (!Responsive.isTablet2(context))
            Container(
              width: 240,
              child: DrawerContent(
                mainCurrentRoute: mainCurrentRoute,
                currentRoute: currentRoute,
                isMobile: false,
              ),
            ),
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                constraints: BoxConstraints(maxWidth: maxWidth ?? 600),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
