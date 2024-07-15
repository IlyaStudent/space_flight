import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_flight/features/articles/presentation/bloc/article_list_cubit/article_list_cubit.dart';
import 'package:space_flight/features/articles/presentation/widgets/articles_list.dart';
import 'package:space_flight/features/articles/presentation/widgets/custome_search_delegate.dart';

@RoutePage()
class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All articles"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: RefreshIndicator(
          onRefresh: context.read<ArticleListCubit>().refreshPage,
          child: ArticlesList()),
    );
  }
}
