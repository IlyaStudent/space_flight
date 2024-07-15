import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_flight/core/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ArticlesRoute(),
        BlogRoute(),
        AboutRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => tabsRouter.setActiveIndex(index),
            currentIndex: tabsRouter.activeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded),
                label: "Articles",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.campaign),
                label: "Blog",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: "About us",
              ),
            ],
          ),
        );
      },
    );
  }
}
