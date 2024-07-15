import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/presentation/bloc/article_list_cubit/article_list_cubit.dart';
import 'package:space_flight/features/articles/presentation/widgets/article_card.dart';
import 'package:space_flight/features/articles/presentation/widgets/loading_widget.dart';

class ArticlesList extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  ArticlesList({super.key});

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<ArticleListCubit>().loadArticles();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<ArticleListCubit, ArticleListState>(
      builder: (context, state) {
        List<ArticleEntity> articles = [];
        bool isLoading = false;
        if (state is ArticleListLoading && state.isFirstFetch) {
          return const LoadingWidget();
        } else if (state is ArticleListLoading) {
          articles = state.oldArticlesList;
          isLoading = true;
        } else if (state is ArticleListLoaded) {
          articles = state.articlesList;
        } else if (state is ArticleListError) {
          return ErrorWidget(state.message);
        } else if (state is ArticleListEmpty) {
          return const Center(
            child: Text(
              "No articles",
              style: TextStyle(fontSize: 25),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < articles.length) {
              return ArticleCard(
                articleEntity: articles[index],
              );
            } else {
              Timer(const Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
            }
            return const SizedBox(
              height: 5,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: articles.length + (isLoading ? 10 : 0),
        );
      },
    );
  }
}
