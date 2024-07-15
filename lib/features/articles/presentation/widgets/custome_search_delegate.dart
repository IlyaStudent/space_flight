import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/presentation/bloc/search_bloc/search_article_bloc.dart';
import 'package:space_flight/features/articles/presentation/widgets/article_card.dart';
import 'package:space_flight/features/articles/presentation/widgets/loading_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final ScrollController scrollController = ScrollController();

  CustomSearchDelegate({super.searchFieldLabel = "Search for article"});

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<SearchArticleBloc>().add(SearchByTitleEvent(query));
        }
      }
    });
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            BlocProvider.of<SearchArticleBloc>(context, listen: false)
                .add(ClearSearchCache());
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_outlined),
        tooltip: 'Back',
        onPressed: () {
          BlocProvider.of<SearchArticleBloc>(context, listen: false)
              .add(ClearSearchCache());
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<SearchArticleBloc>(context, listen: false)
        .add(ClearSearchCache());
    setupScrollController(context);
    BlocProvider.of<SearchArticleBloc>(context, listen: false)
        .add(SearchByTitleEvent(query));

    return BlocBuilder<SearchArticleBloc, SearchArticleState>(
        builder: (context, state) {
      List<ArticleEntity> articles = [];
      bool isLoading = false;
      if (state is SearchArticleLoading) {
        articles = state.oldArticles;
        isLoading = true;
      } else if (state is SearchArticleLoaded) {
        articles = state.articles;
      } else if (state is SearchArticleError) {
        return ErrorWidget(state.message);
      } else if (articles.isEmpty || state is SearchArticleEmpty) {
        return const Center(
          child: Text("No articles found"),
        );
      }
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        controller: scrollController,
        itemCount: articles.length,
        itemBuilder: ((context, index) {
          if (index < articles.length) {
            return ArticleCard(articleEntity: articles[index]);
          } else {
            Timer(const Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });
          }
          return const SizedBox(
            height: 5,
          );
        }),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
