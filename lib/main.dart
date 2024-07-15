import 'package:flutter/material.dart';
import 'package:space_flight/core/router/app_router.dart';
import 'package:space_flight/features/articles/presentation/bloc/article_by_id_bloc/article_by_id_bloc.dart';
import 'package:space_flight/features/articles/presentation/bloc/article_list_cubit/article_list_cubit.dart';
import 'package:space_flight/features/articles/presentation/bloc/search_bloc/search_article_bloc.dart';
import 'package:space_flight/locator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const SpaceFlightApp());
}

class SpaceFlightApp extends StatefulWidget {
  const SpaceFlightApp({super.key});

  @override
  State<SpaceFlightApp> createState() => _SpaceFlightAppState();
}

class _SpaceFlightAppState extends State<SpaceFlightApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleListCubit>(
          create: (context) => sl<ArticleListCubit>()..loadArticles(),
        ),
        BlocProvider<ArticleByIdBloc>(
          create: (context) => sl<ArticleByIdBloc>(),
        ),
        BlocProvider<SearchArticleBloc>(
            create: (context) => sl<SearchArticleBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Space Flights',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
