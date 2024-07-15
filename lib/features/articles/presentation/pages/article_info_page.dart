import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_flight/features/articles/presentation/bloc/article_by_id_bloc/article_by_id_bloc.dart';
import 'package:space_flight/features/articles/presentation/widgets/article_info_widget.dart';
import 'package:space_flight/features/articles/presentation/widgets/loading_widget.dart';

class ArticleInfoPage extends StatelessWidget {
  const ArticleInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ArticleByIdBloc, ArticleByIdState>(
          builder: (context, state) {
        if (state is ArticleInfoLoading) {
          return const LoadingWidget();
        } else if (state is ArticleInfoEmpty) {
          return const Center(
            child: Text("No info"),
          );
        } else if (state is ArticleInfoError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is ArticleInfoLoaded) {
          return ArticleInfoWidget(articleEntity: state.articleEntity);
        }
        return const LoadingWidget();
      }),
    );
  }
}
