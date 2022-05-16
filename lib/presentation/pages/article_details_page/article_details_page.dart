import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/theme/colors.dart';

import '../../../domain/news_model.dart';
import '../../helpers/presentation_helpers.dart';
import '../shared_widgets/shared_widgets.dart';
import 'widgets/widgets.dart';

class ArticleDetails extends StatefulWidget {
  static const routeName = '/article-details';

  const ArticleDetails({Key? key}) : super(key: key);

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  late NewsModel article;

  @override
  Widget build(BuildContext context) {
    initializeArguments(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ApplicationBackButton(
            boxColor: ApplicationColor.navDisActiveBottom,
            arrowColor: ApplicationColor.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: article.image,
              child: CachedNetworkImage(
                imageUrl: article.image,
                height: 200.h,
                width: double.infinity,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      //AssetImage(PresentationAssetPath.ACTIVITY_DEFAULT),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: const CircularProgressIndicator(),
                )),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border:
                          Border.all(color: ApplicationColor.white, width: 1.6),
                      color: ApplicationColor.navDisActiveBottom,
                      image: const DecorationImage(
                          image:
                              AssetImage(PresentationAssetPath.ARTICLE_DEFAULT),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
            ArticleDetailsTextList(article: article),
          ],
        ),
      ),
    );
  }

  void initializeArguments(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    article = arguments['article'] as NewsModel;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
