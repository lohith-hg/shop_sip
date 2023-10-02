import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/authentication/view/authentication_screen.dart';
import 'features/product/models/beer.dart';
import 'features/product/view/product_detail_screen.dart';
import 'features/product/view/products_screen.dart';
import 'features/profile/view/profile_screen.dart';

final router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/auth';
    }
  },
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthenticationScreen(),
    ),
    GoRoute(
      path: '/',
      name:'Products',
      builder: (context, state) {
        return const ProductsScreen();
      },
      routes: [
        GoRoute(
          path: 'productDetail',
          name: 'productDetail',
          builder: (context, state) {
            Beer beer = state.extra as Beer;
            return ProductDetailScreen(beer: beer);
          },
        ),
        GoRoute(
          path: 'profile',
          name: 'profile',
          builder: (context, state) {
            return const ProfileScreen();
          },
        ),
      ],
    ),
  ],
);
