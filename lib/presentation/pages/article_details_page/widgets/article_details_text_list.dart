part of 'widgets.dart';


class ArticleDetailsTextList extends StatelessWidget {
  final NewsModel article;
  const ArticleDetailsTextList({
    Key? key,
    required this.article
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title,
            style: TextStyle(
              color: ApplicationColor.textTitleColor,
              fontSize: 24.sp,
              fontWeight: ApplicationFont.heavy,
            ),
          ),
          SizedBox(height: 11.h,),
          Text(
            article.articleDetails,
            style: TextStyle(
                color: ApplicationColor.textSubTitleColor,
                fontSize: 20.sp,
                fontWeight: ApplicationFont.regular,
                height: 1.5
            ),
          ),
        ],
      ),
    );
  }
}
