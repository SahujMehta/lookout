import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../splash_screen.dart';
import '../my_home_page.dart';
import '../contacts.dart';
import '../help.dart';
import '../settings.dart';
import '../authentication_screen.dart';
import 'routes.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: '/settings',
      name: AppRoute.settings.name,
      builder: (context, state) => Settings(),
    ),
    GoRoute(
      path: '/authentication',
      name: AppRoute.authentication_screen.name,
      builder: (context, state) => AuthenticationScreen(),
    ),
    GoRoute(
      path: '/splash',
      name: AppRoute.splash_screen.name,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/help',
      name: AppRoute.help.name,
      builder: (context, state) => Help(),
    ),
    GoRoute(
      path: '/contacts',
      name: AppRoute.contacts.name,
      builder: (context, state) => ContactsList(),
    )
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
