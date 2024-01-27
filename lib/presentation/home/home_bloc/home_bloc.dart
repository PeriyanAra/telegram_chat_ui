import 'package:domain/domain_layer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/view_models/home_screen_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc({required this.homeUseCase}) : super(const HomeState.initial()) {
    on<GetHomeDataEvent>(_handleGetHomeDataEvent);
  }
  Future<void> _handleGetHomeDataEvent(
    GetHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());

    final response = await homeUseCase.getData();

    response.when(
      success: (data) {
        emit(
          HomeState.loaded(
            homeScreenViewModel: HomeScreenViewModel.fromEntity(homeData: data),
          ),
        );
      },
      failure: (f) {
        emit(
          HomeState.error(errorMessage: f.debugMessage),
        );
      },
    );
  }
}
