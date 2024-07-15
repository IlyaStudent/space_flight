import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/presentation/bloc/article_by_id_bloc/article_by_id_bloc.dart';
import 'package:space_flight/features/articles/presentation/pages/article_info_page.dart';
import 'package:space_flight/features/articles/presentation/widgets/article_cache_image.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity articleEntity;
  const ArticleCard({super.key, required this.articleEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ArticleByIdBloc>(context)
            .add(GetInfo(articleEntity.id.toString()));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ArticleInfoPage()));
      },
      child: Row(
        children: [
          ArticleCacheImage(
            imageUrl: articleEntity.imageUrl,
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (articleEntity.title.length > 20)
                      ? "${articleEntity.title.substring(0, 20)}..."
                      : articleEntity.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Text(
                    articleEntity.summary,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // "${articleEntity.summary.substring(0, 30)}...",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
