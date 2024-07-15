// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    ArticlesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArticlesPage(),
      );
    },
    BlogRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ArticlesPage]
class ArticlesRoute extends PageRouteInfo<void> {
  const ArticlesRoute({List<PageRouteInfo>? children})
      : super(
          ArticlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BlogPage]
class BlogRoute extends PageRouteInfo<void> {
  const BlogRoute({List<PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
