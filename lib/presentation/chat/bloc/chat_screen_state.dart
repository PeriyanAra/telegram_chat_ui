part of 'chat_screen_bloc.dart';

@freezed
class ChatScreenState with _$ChatScreenState {
  const factory ChatScreenState.loading() = ChatScreenLoadingState;

  const factory ChatScreenState.loaded({
    required ChatScreenViewModel viewModel,
  }) = ChatScreenLoadedState;

  const factory ChatScreenState.error({
    required String errorMessage,
    required ChatScreenViewModel viewModel,
  }) = ChatScreenErrorState;
}
