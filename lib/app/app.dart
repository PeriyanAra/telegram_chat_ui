import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/app/app_bootstrapper.dart';
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
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const SizedBox(),
    );
  }
}
