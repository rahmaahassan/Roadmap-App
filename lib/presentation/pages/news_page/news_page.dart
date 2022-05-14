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
    return Scaffold(
        appBar: const ApplicationAppBar(
          title: ApplicationTextValue.NEWS_TITLE,
        ),
        body: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NewsSuccessState) {
                return articleBuilder(state.news, context);
              } else if(state is NewsErrorState) {
                return Center(child: Text(state.error),);
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            }));
  }
}
