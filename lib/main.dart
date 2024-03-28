import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:futactix/src/design.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      locale: const Locale('fi'),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late final l10n = L10n.of(context);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: _menuBar(
        child: Column(
          children: [
            const Toolbar(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  PlatformMenuBar _menuBar({required Widget child}) {
    return PlatformMenuBar(
      menus: [
        PlatformMenu(
          label: l10n.title,
          menus: [
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarAbout,
                  onSelected: () {
                    print('Clicked About Futactix');
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarSettings,
                  onSelected: () {
                    print('Clicked Settings');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.comma,
                    meta: true,
                  ),
                ),
              ],
            ),
            PlatformMenuItem(
              label: l10n.menubarQuit,
              onSelected: () {
                print('Clicked Quit');
                SystemNavigator.pop();
              },
              shortcut: const SingleActivator(
                LogicalKeyboardKey.keyQ,
                meta: true,
              ),
            ),
          ],
        ),
        PlatformMenu(
          label: l10n.menubarFile,
          menus: [
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarNewProject,
                  onSelected: () {
                    print('Clicked File > New Project');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyN,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarOpen,
                  onSelected: () {
                    print('Clicked File > Open');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyO,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarSave,
                  onSelected: () {
                    print('Clicked File > Save');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyS,
                    meta: true,
                  ),
                ),
              ],
            ),
          ],
        ),
        PlatformMenu(
          label: l10n.menubarEdit,
          menus: [
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarUndo,
                  onSelected: () {
                    print('Clicked Edit > Undo');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyZ,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarClear,
                  onSelected: () {
                    print('Clicked Edit > Clear Drawings');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarRemoveObjects,
                  onSelected: () {
                    print('Clicked Edit > Remove Objects');
                  },
                ),
              ],
            ),
          ],
        ),
        PlatformMenu(
          label: l10n.menubarFormations,
          menus: [
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarFootball5,
                  onSelected: () {
                    print('Clicked Formations > Football 5');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball8,
                  onSelected: () {
                    print('Clicked Formations > Football 8');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball11,
                  onSelected: () {
                    print('Clicked Formations > Football 11');
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarFootball5vs5,
                  onSelected: () {
                    print('Clicked Formations > Football 5 vs 5');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball8vs8,
                  onSelected: () {
                    print('Clicked Formations > Football 8 vs 8');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball11vs11,
                  onSelected: () {
                    print('Clicked Formations > Football 11 vs 11');
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarFutsal5,
                  onSelected: () {
                    print('Clicked Formations > Futsal 5');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFutsal5vs5,
                  onSelected: () {
                    print('Clicked Formations > Futsal 5 vs 5');
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      child: child,
    );
  }
}
