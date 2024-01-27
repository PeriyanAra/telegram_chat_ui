import 'package:domain/domain_layer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/enums/user_activity_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/mocks/chat_screen_mock_view_model.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/view_models/chat_message_view_model.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/view_models/chat_screen_view_model.dart';

part 'chat_screen_bloc.freezed.dart';
part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  final ChatUseCase _chatUseCase;

  ChatScreenBloc({
    required ChatUseCase chatUseCase,
  })  : _chatUseCase = chatUseCase,
        super(
          const ChatScreenState.loading(),
        ) {
    on<ChatScreenGetDataEvent>(_handleChatScreenGetDataEvent);
    on<ChatScreenSendMessageEvent>(_handleChatScreenSendMessageEvent);
    on<ChatScreenDeleteMessageEvent>(_handleChatScreenDeleteMessageEvent);
    on<ChatScreenLikeMessageEvent>(_handleChatScreenLikeMessageEvent);
  }

  Future<void> _handleChatScreenGetDataEvent(
    ChatScreenGetDataEvent event,
    Emitter<ChatScreenState> emit,
  ) async {
    final response = await _chatUseCase.fetchData();

    response.when(
      success: (data) {
        final messages = data.map(ChatMessageViewModel.fromEntity).toList();

        emit(
          ChatScreenState.loaded(
            viewModel: ChatScreenViewModel(
              chatTitle: chatScreenMockViewModel.sender.firstName,
              sender: chatScreenMockViewModel.sender,
              activityStatus: UserActivityStatus.online,
              messages: messages,
            ),
          ),
        );
      },
      failure: (error) {
        emit(
          ChatScreenState.error(
            errorMessage: error.debugMessage,
            viewModel: ChatScreenViewModel(
              chatTitle: chatScreenMockViewModel.sender.firstName,
              sender: chatScreenMockViewModel.sender,
              activityStatus: UserActivityStatus.online,
              messages: [],
            ),
          ),
        );
      },
    );
  }

  void _handleChatScreenSendMessageEvent(
    ChatScreenSendMessageEvent event,
    Emitter<ChatScreenState> emit,
  ) {
    if (state is! ChatScreenLoadedState) return;

    _chatUseCase.sendMessage(message: event.message.message);

    final currentState = state as ChatScreenLoadedState;
    final currentMessages = List.of(currentState.viewModel.messages);

    currentMessages.add(event.message);

    emit(
      ChatScreenState.loaded(
        viewModel: currentState.viewModel.copyWith(
          messages: currentMessages,
        ),
      ),
    );
  }

  void _handleChatScreenDeleteMessageEvent(
    ChatScreenDeleteMessageEvent event,
    Emitter<ChatScreenState> emit,
  ) {
    if (state is! ChatScreenLoadedState) return;

    _chatUseCase.deleteMessage(messageId: event.message.id);

    final currentState = state as ChatScreenLoadedState;
    final currentMessages = List.of(currentState.viewModel.messages);

    currentMessages.remove(event.message);

    emit(
      ChatScreenState.loaded(
        viewModel: currentState.viewModel.copyWith(
          messages: currentMessages,
        ),
      ),
    );
  }

  void _handleChatScreenLikeMessageEvent(
    ChatScreenLikeMessageEvent event,
    Emitter<ChatScreenState> emit,
  ) {
    if (state is! ChatScreenLoadedState) return;

    final currentState = state as ChatScreenLoadedState;
    final updatedMessages = currentState.viewModel.messages.map((message) {
      if (message.id == event.id) {
        return message.copyWith(
          isLiked: !message.isLiked,
          reactionIcon: event.reactionIcon,
        );
      }

      return message;
    }).toList();

    emit(
      ChatScreenState.loaded(
        viewModel: currentState.viewModel.copyWith(messages: updatedMessages),
      ),
    );
  }
}
