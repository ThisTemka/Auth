import 'package:auth/pages/confirm/states/data/i_confirm_page_data_state.dart';

class ConfirmPageDataState implements IConfirmPageDataState {
  @override
  final bool resendEnabled;
  @override
  final String? error;
  @override
  final bool isLoading;

  const ConfirmPageDataState({
    required this.resendEnabled,
    this.error,
    required this.isLoading,
  });

  @override
  ConfirmPageDataState copyWith({
    bool? resendEnabled,
    bool? nullError,
    String? error,
    bool? isLoading,
  }) {
    return ConfirmPageDataState(
      resendEnabled: resendEnabled ?? this.resendEnabled,
      error: nullError == true ? null : error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
