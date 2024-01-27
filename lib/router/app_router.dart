import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/home_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: 'home', page: HomeScreen, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
