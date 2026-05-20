import 'package:base_flutter_2/core/presentation/base_cubit.dart';
import 'package:base_flutter_2/core/presentation/base_state.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/news_repository.dart';
import 'news_state.dart';

@injectable
class NewsCubit extends BaseCubit<NewsState> {
  NewsCubit(this._newsRepository) : super(const NewsState());

  final NewsRepository _newsRepository;

  Future<void> fetchNews() async {
    await handleResult(
      action: _newsRepository.getNews,
      onLoading: (state) => state.copyWith(status: BaseStatus.loading),
      onSuccess: (state, data) =>
          state.copyWith(status: BaseStatus.success, news: data),
      onFailure: (state, message) =>
          state.copyWith(status: BaseStatus.failure, errorMessage: message),
    );
  }
}
