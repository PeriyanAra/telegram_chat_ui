import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_app_foundation/app/app_bootstrapper.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/bloc/chat_screen_bloc.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/mocks/chat_screen_mock_view_model.dart';
import 'package:flutter_mobile_app_foundation/theming/index.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    AppBootstrapper.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: AppBootstrapper.instance.isInitializedStream,
      builder: (context, snapshot) {
        var isInitialized = false;

        if (snapshot.data != null) {
          isInitialized = snapshot.data ?? false;
        }

        if (!isInitialized) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return MaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: BlocProvider.value(
            value: get<ChatScreenBloc>()..add(const ChatScreenEvent.getData()),
            child: GestureDetector(
              onTap: () => {
                get<ChatScreenBloc>().add(ChatScreenEvent.likeMessage(
                  id: chatScreenMockViewModel.messages.last.id,
                  reactionIcon: 'smile',
                ))
              },
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
