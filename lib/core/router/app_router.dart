import 'package:auto_route/auto_route.dart';
import 'package:space_flight/core/presentation/pages/home_screen.dart';
import 'package:space_flight/features/about/presentation/pages/about_page.dart';
import 'package:space_flight/features/blog/presentation/pages/blog_page.dart';
import 'package:space_flight/features/articles/presentation/pages/articles_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: "/", children: [
          AutoRoute(
            page: ArticlesRoute.page,
            path: "articles",
          ),
          AutoRoute(
            page: BlogRoute.page,
            path: "blog",
          ),
          AutoRoute(
            page: AboutRoute.page,
            path: "about",
          ),
        ])
        // AutoRoute(
        //   page: NewsRoute.page,
        //   path: "/news",
        //   children: [
        //     AutoRoute(
        //       page: BlogRoute.page,
        //       path: "blog",
        //     ),
        //     AutoRoute(
        //       page: AboutRoute.page,
        //       path: "about",
        //     )
        //   ],
        // ),
      ];
}
