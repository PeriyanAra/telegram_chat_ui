import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain_layer.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/home_bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mocks.mocks.dart';

void main() {
  group('HomeBloc test', () {
    final mockHomeUseCase = MockHomeUseCase();

    const mockHomeData = HomeData(characters: []);

    setUp(() {
      when(
        mockHomeUseCase.getData(),
      ).thenAnswer(
        (_) async => Future.value(
          const Result.success(mockHomeData),
        ),
      );
    });

    blocTest<HomeBloc, HomeState>(
      'state should be HomeInitialState',
      build: () => HomeBloc(homeUseCase: mockHomeUseCase),
      verify: (bloc) {
        expect(
          bloc.state,
          const HomeInitialState(),
        );
      },
    );

    blocTest<HomeBloc, HomeState>(
      'state should be HomeLoadingState and then HomeLoadedState',
      build: () => HomeBloc(homeUseCase: mockHomeUseCase),
      act: (bloc) => bloc.add(const HomeEvent.getData()),
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeLoadedState>(),
      ],
    );
  });
}
