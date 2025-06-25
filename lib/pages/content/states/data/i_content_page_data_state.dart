import 'package:auth/pages/content/states/data/content_page_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentPageDataStateProvider =
    StateProvider<IContentPageDataState>((ref) {
  final state = ContentPageDataState(
    isLoading: false,
  );
  return state;
});

abstract interface class IContentPageDataState {
  bool get isLoading;

  IContentPageDataState copyWith({
    bool? isLoading,
  });
}
