import 'package:auth/pages/content/states/data/i_content_page_data_state.dart';

class ContentPageDataState implements IContentPageDataState {
  @override
  final bool isLoading;

  const ContentPageDataState({
    required this.isLoading,
  });

  @override
  ContentPageDataState copyWith({
    bool? isLoading,
  }) {
    return ContentPageDataState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
