import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/news/cubit/cubit.dart';
import '../../../application/news/cubit/states.dart';
import '../../helpers/presentation_helpers.dart';
import '../shared_widgets/shared_widgets.dart';
import 'widgets/widgets.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).news;

        return Scaffold(
            appBar: const ApplicationAppBar(
              title: ApplicationTextValue.NEWS_TITLE,
            ),
            body: articleBuilder(list, context));
      },
    );
  }
}
