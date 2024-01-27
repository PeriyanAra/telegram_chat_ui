import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/app/app_bootstrapper.dart';
import 'package:flutter_mobile_app_foundation/router/app_router.dart';
import 'package:flutter_mobile_app_foundation/theming/index.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    AppBootstrapper.instance.initialize();
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
