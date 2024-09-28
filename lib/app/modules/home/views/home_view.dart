import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/modules/home/controllers/home_controller.dart';
import 'package:estrellas_dashboard/app/modules/home/views/views/catalog_view.dart';
import 'package:estrellas_dashboard/app/modules/home/views/views/more_view.dart';
import 'package:estrellas_dashboard/app/modules/home/views/views/search_view.dart';
import 'package:estrellas_dashboard/app/modules/home/views/views/wallet_view.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'views/initial_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  bool _navigationExtended = true;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTinyPhone = screenWidth < 320;
    bool isMobile = screenWidth < 480;
    bool isTablet = screenWidth < 740;
    bool isTablet2 = screenWidth < 890;
    bool isDesktop = screenWidth > 720;
    PageController pageController = PageController();

    return GetBuilder<HomeController>(
      id: 'view',
      builder: (controller) {
        return Scaffold(
          floatingActionButton: _selectedIndex == 3
              ? FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                )
              : null,
          appBar: !isTablet
              ? AppBar(
                  toolbarHeight: 70,
                  centerTitle: true,
                  title: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                              pageController.animateToPage(
                                0,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.ease,
                              );
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/svg/fulllogo.svg',
                            height: 40,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Spacer(),
                        GetBuilder<MainController>(
                          id: 'login',
                          builder: (_) {
                            return Row(
                              children: [
                                if (mainController.userStatus ==
                                    UserStatus.loading)
                                  Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.redAccent,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: SizedBox(width: 60),
                                    ),
                                  )
                                else
                                  ElevatedButton(
                                    onPressed: mainController.signOut,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer, // Color secundario
                                    ),
                                    child: Text('Cerrar sesión'),
                                  ),
                              ],
                            );
                          },
                        ),
                        SizedBox(width: 8),
                        GetBuilder<MainController>(
                          id: 'themeButton',
                          builder: (mainController) {
                            return IconButton(
                              onPressed: mainController.changeThemeColor,
                              icon: const Icon(Icons.color_lens),
                            );
                          },
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : AppBar(
                  title: Text('mobile'),
                ),
          body: Row(
            children: [
              if (!isTablet)
                //poner el drawer aqui
                Container(
                  width: 120,
                  color: Colors.black,
                ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      child: Text('home'),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
