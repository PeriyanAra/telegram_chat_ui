import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/home_bloc/home_bloc.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/home_screen.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/view_models/home_screen_view_model.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/widgets/home_error_content.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/widgets/home_loaded_content.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/widgets/home_loading_content.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() async {

  const mockHomeScreenViewModel = HomeScreenViewModel(characters: []);

  Widget _getTestingApp(MockHomeBloc mockHomeBloc) {
    return BlocProvider<HomeBloc>(
      create: (_) => mockHomeBloc
        ..add(
          const HomeEvent.getData(),
        ),
      child: const MaterialApp(
        home: HomeScreenContentBuilder(),
      ),
    );
  }

  group(
    'HomeLoadingContent test',
    () {
      final mockHomeBloc = MockHomeBloc();

      setUp(() {
        when(() => mockHomeBloc.state).thenReturn(const HomeState.loading());
      });
      testWidgets(
        'When state is HomeLoadingState, HomeLoadingContent should present',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await tester.pumpWidget(_getTestingApp(mockHomeBloc));
              await tester.pump(Duration.zero);
              expect(find.byType(HomeLoadingContent), findsOneWidget);
            },
          );
        },
      );
    },
  );

  group(
    'HomeLoadedContent test',
    () {
      final mockHomeBloc = MockHomeBloc();

      setUp(() {
        when(() => mockHomeBloc.state)
            .thenReturn(const HomeState.loaded(homeScreenViewModel: mockHomeScreenViewModel));
      });
      testWidgets(
        'When state is HomeLoadedState, HomeLoadedContent should present',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await tester.pumpWidget(
                _getTestingApp(mockHomeBloc),
              );
              await tester.pump(Duration.zero);
              expect(find.byType(HomeLoadedContent), findsOneWidget);
            },
          );
        },
      );
    },
  );

  group(
    'HomeErrorContent test',
    () {
      final mockHomeBloc = MockHomeBloc();

      setUp(() {
        when(() => mockHomeBloc.state)
            .thenReturn(const HomeState.error(errorMessage: 'errorMessage'));
      });

      testWidgets(
        'When state is HomeErrorState, HomeErrorContent should present',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await tester.pumpWidget(
                _getTestingApp(mockHomeBloc),
              );
              await tester.pump(Duration.zero);
              expect(find.byType(HomeErrorContent), findsOneWidget);
            },
          );
        },
      );
    },
  );
}
