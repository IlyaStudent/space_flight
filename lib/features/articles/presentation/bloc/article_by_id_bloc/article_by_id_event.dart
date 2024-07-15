part of 'article_by_id_bloc.dart';

sealed class ArticleByIdEvent extends Equatable {
  const ArticleByIdEvent();

  @override
  List<Object> get props => [];
}

class GetInfo extends ArticleByIdEvent {
  final String id;

  const GetInfo(this.id);
}
