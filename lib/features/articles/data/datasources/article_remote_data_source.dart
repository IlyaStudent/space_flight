import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:space_flight/features/articles/data/models/article_list_model.dart';
import 'package:space_flight/features/articles/data/models/article_model.dart';

part "article_remote_data_source.g.dart";

@RestApi(baseUrl: "https://api.spaceflightnewsapi.net/v4/")
abstract class ArticleRemoteDataSource {
  factory ArticleRemoteDataSource(Dio dio, {String baseUrl}) =
      _ArticleRemoteDataSource;

  @GET("articles/")
  Future<ArticleListModel> getAllArticles(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @GET("articles/{id}")
  Future<ArticleModel> getArticleById(
    @Path("id") String id,
  );

  @GET("articles/")
  Future<ArticleListModel> searchArticle(
    @Query("title_contains") String query,
    @Query("offset") int offset,
  );
}
