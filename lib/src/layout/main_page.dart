import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:futactix/src/design.dart';
import 'package:futactix/src/layout/main_page_platform_menu_bar.dart';
import 'package:futactix/src/util.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final l10n = L10n.of(context);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: MainPagePlatformMenuBar(
        child: Column(
          children: [
            Toolbar(
              children: [
                ToolbarGroup(
                  title: l10n.toolbarAttackingPlayer,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.attackingPlayer,
                        color: Colors.blue,
                      ),
                      const Icon(
                        Icons.attackingPlayer,
                        color: Colors.red,
                      ),
                      const Icon(
                        Icons.attackingPlayer,
                        color: Colors.yellow,
                      ),
                      const Icon(
                        Icons.attackingPlayer,
                        color: Colors.grey,
                      ),
                    ].intersperse(const SizedBox(width: 8)).toList(),
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarDefendingPlayer,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.defendingPlayer,
                        color: Colors.blue,
                      ),
                      const Icon(
                        Icons.defendingPlayer,
                        color: Colors.red,
                      ),
                      const Icon(
                        Icons.defendingPlayer,
                        color: Colors.yellow,
                      ),
                      const Icon(
                        Icons.defendingPlayer,
                        color: Colors.grey,
                      ),
                    ].intersperse(const SizedBox(width: 8)).toList(),
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarDummy,
                  child: const Icon(Icons.dummy),
                ),
                ToolbarGroup(
                  title: l10n.toolbarHoop,
                  child: const Icon(
                    Icons.hoop,
                    color: Colors.yellow,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarPileOfBalls,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarBall,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarPoleOnGround,
                  child: const Icon(
                    Icons.poleOnGround,
                    color: Colors.brown,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarPoleStanding,
                  child: Row(
                    children: <Widget>[
                      const Stack(
                        children: [
                          Icon(
                            Icons.poleStandingBackground,
                            color: Colors.brightRed,
                          ),
                          Icon(Icons.poleStandingForeground),
                        ],
                      ),
                      const Stack(
                        children: [
                          Icon(
                            Icons.poleStandingBackground,
                            color: Colors.orange,
                          ),
                          Icon(Icons.poleStandingForeground),
                        ],
                      ),
                    ].intersperse(const SizedBox(width: 16)).toList(),
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarMarker,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.marker,
                        color: Colors.yellow,
                      ),
                      const Icon(
                        Icons.marker,
                        color: Colors.brightRed,
                      ),
                      const Icon(
                        Icons.marker,
                        color: Colors.blue,
                      ),
                    ].intersperse(const SizedBox(width: 4)).toList(),
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarCone,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarFence,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarBench,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarLadder,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarSmallGoal,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarBigGoal,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
                ToolbarGroup(
                  title: l10n.toolbarFutsalGoal,
                  child: const Icon(
                    Icons.attackingPlayer,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Material(
                elevation: 0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
