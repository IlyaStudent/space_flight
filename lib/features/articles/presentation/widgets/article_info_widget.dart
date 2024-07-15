import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/presentation/widgets/article_cache_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleInfoWidget extends StatelessWidget {
  final ArticleEntity articleEntity;
  const ArticleInfoWidget({super.key, required this.articleEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ArticleCacheImage(
                imageUrl: articleEntity.imageUrl,
                width: MediaQuery.sizeOf(context).width * 0.85,
                height: MediaQuery.sizeOf(context).width * 0.85,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                articleEntity.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            Text(articleEntity.summary),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(articleEntity.url));
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.link,
                        size: 30,
                      ),
                    ),
                    Text(
                      "More info",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
