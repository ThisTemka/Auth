import 'package:auth/pages/confirm/states/data/confirm_page_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmPageDataStateProvider =
    StateProvider<IConfirmPageDataState>((ref) {
  final state = ConfirmPageDataState(
    resendEnabled: false,
    isLoading: false,
  );
  return state;
});

abstract interface class IConfirmPageDataState {
  bool get resendEnabled;
  String? get error;
  bool get isLoading;

  IConfirmPageDataState copyWith({
    bool? resendEnabled,
    bool? nullError,
    String? error,
    bool? isLoading,
  });
}
