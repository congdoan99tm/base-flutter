import 'package:flutter/material.dart';
import 'package:base_flutter_2/core/presentation/base_page.dart';
import 'cubit/news_cubit.dart';
import 'cubit/news_state.dart';

class NewsPage extends BasePage<NewsCubit, NewsState> {
  const NewsPage({super.key});

  @override
  void onReady(BuildContext context, NewsCubit cubit) => cubit.fetchNews();

  @override
  Widget buildSuccess(BuildContext context, NewsState state) {
    return Center(child: Text('Success: ${state.news?.id}'));
  }
}
