import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/domain/usecases/get_article_by_id.dart';

part 'article_by_id_event.dart';
part 'article_by_id_state.dart';

class ArticleByIdBloc extends Bloc<ArticleByIdEvent, ArticleByIdState> {
  final GetArticleById getArticleById;

  ArticleByIdBloc({required this.getArticleById}) : super(ArticleInfoEmpty()) {
    on<GetInfo>(_onEvent);
  }

  Future<void> _onEvent(
    GetInfo event,
    Emitter<ArticleByIdState> emit,
  ) async {
    emit(ArticleInfoLoading());
    final failureOrArticle =
        await getArticleById(IdArticleParams(id: event.id));
    emit(failureOrArticle.fold(
      (failure) => const ArticleInfoError(message: "Server failure"),
      (article) => ArticleInfoLoaded(articleEntity: article),
    ));
  }
}
