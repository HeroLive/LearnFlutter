// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';

import 'screens/cart.dart';
import 'screens/catalog.dart';
import 'screens/login.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CartModel())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MaterialApp(
      title: 'Provider Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/catalog': (context) => const CatalogPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
