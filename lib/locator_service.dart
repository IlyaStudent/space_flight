import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:space_flight/core/networking/network_info.dart';
import 'package:space_flight/features/articles/data/datasources/article_remote_data_source.dart';
import 'package:space_flight/features/articles/data/repositories/article_repository_implementation.dart';
import 'package:space_flight/features/articles/domain/repositories/article_repository.dart';
import 'package:space_flight/features/articles/domain/usecases/get_all_articles.dart';
import 'package:space_flight/features/articles/domain/usecases/get_article_by_id.dart';
import 'package:space_flight/features/articles/domain/usecases/search_article.dart';
import 'package:space_flight/features/articles/presentation/bloc/article_by_id_bloc/article_by_id_bloc.dart';
import 'package:space_flight/features/articles/presentation/bloc/article_list_cubit/article_list_cubit.dart';
import 'package:space_flight/features/articles/presentation/bloc/search_bloc/search_article_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC & Cubit
  sl.registerFactory(
      () => ArticleListCubit(getAllArticles: sl<GetAllArticles>()));
  sl.registerFactory(
      () => ArticleByIdBloc(getArticleById: sl<GetArticleById>()));
  sl.registerFactory(() => SearchArticleBloc(sl<SearchArticle>()));

  // UseCase
  sl.registerLazySingleton(() => GetAllArticles(sl()));
  sl.registerLazySingleton(() => GetArticleById(sl()));
  sl.registerLazySingleton(() => SearchArticle(sl()));

  // Repository
  sl.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImplementation(
            articleRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<ArticleRemoteDataSource>(
    () => ArticleRemoteDataSource(sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementation(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
