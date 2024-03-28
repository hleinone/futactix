import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:futactix/src/design.dart';
import 'package:futactix/src/layout/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => L10n.of(context).title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x0000308C)),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Flutter Demo Home Page'),
      locale: const Locale('fi'),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
    );
  }
}
