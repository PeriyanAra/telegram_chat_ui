import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_app_foundation/app/app_bootstrapper.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/home_bloc/home_bloc.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/widgets/home_error_content.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/widgets/home_loaded_content.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/widgets/home_loading_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: get<HomeBloc>()..add(const HomeEvent.getData()),
      child: const HomeScreenContentBuilder(),
    );
  }
}

class HomeScreenContentBuilder extends StatelessWidget {
  const HomeScreenContentBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
        title: const Text(
          'Rick and Morty cgaracters',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadedState) {
            return HomeLoadedContent(
              homeScreenViewModel: state.homeScreenViewModel,
            );
          }
          if (state is HomeLoadingState) {
            return const HomeLoadingContent();
          }
          if (state is HomeErrorState) {
            return HomeErrorContent(
              errorMessage: state.errorMessage,
            );
          }
          return const HomeLoadingContent();
        },
      ),
    );
  }
}
