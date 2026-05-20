import 'package:base_flutter_2/core/presentation/base_state.dart';

import '../../data/models/news_model.dart';

class NewsState extends BaseState {
  const NewsState({super.status, super.errorMessage, this.news});

  final NewsModel? news;

  NewsState copyWith({
    BaseStatus? status,
    NewsModel? news,
    String? errorMessage,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [...super.props, news];
}
