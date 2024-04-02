import 'package:futactix/src/design.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:futactix/src/util.dart';

class MainPageToolbar extends StatelessWidget {
  const MainPageToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Toolbar(
      children: [
        ToolbarGroup(
          title: l10n.toolbarOffensivePlayer,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ToolbarItem(
                direction: Direction.forward,
                child: Icon(
                  Icons.offensivePlayer,
                  color: Colors.blue,
                ),
              ),
              const ToolbarItem(
                direction: Direction.forward,
                child: Icon(
                  Icons.offensivePlayer,
                  color: Colors.red,
                ),
              ),
              const ToolbarItem(
                direction: Direction.forward,
                child: Icon(
                  Icons.offensivePlayer,
                  color: Colors.yellow,
                ),
              ),
              const ToolbarItem(
                direction: Direction.forward,
                child: Icon(
                  Icons.offensivePlayer,
                  color: Colors.grey,
                ),
              ),
            ].intersperse(const SizedBox(width: 8)).toList(),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarDefensivePlayer,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ToolbarItem(
                direction: Direction.backward,
                child: Icon(
                  Icons.defensivePlayer,
                  color: Colors.blue,
                ),
              ),
              const ToolbarItem(
                direction: Direction.backward,
                child: Icon(
                  Icons.defensivePlayer,
                  color: Colors.red,
                ),
              ),
              const ToolbarItem(
                direction: Direction.backward,
                child: Icon(
                  Icons.defensivePlayer,
                  color: Colors.yellow,
                ),
              ),
              const ToolbarItem(
                direction: Direction.backward,
                child: Icon(
                  Icons.defensivePlayer,
                  color: Colors.grey,
                ),
              ),
            ].intersperse(const SizedBox(width: 8)).toList(),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarDummy,
          child: const ToolbarItem(
            direction: Direction.forward,
            child: Icon(Icons.dummy),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarHoop,
          child: const ToolbarItem(
            child: Icon(
              Icons.hoop,
              color: Colors.yellow,
            ),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarPileOfBalls,
          child: const ToolbarItem(
            child: Icon(Icons.pileOfBalls),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarBall,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ToolbarItem(
                child: Stack(
                  children: [
                    Icon(
                      Icons.ballBackground,
                      color: Colors.lightGrey,
                    ),
                    Icon(Icons.ballForeground),
                  ],
                ),
              ),
              const ToolbarItem(
                child: Stack(
                  children: [
                    Icon(
                      Icons.ballBackground,
                      color: Colors.yellow,
                    ),
                    Icon(Icons.ballForeground),
                  ],
                ),
              ),
            ].intersperse(const SizedBox(width: 4)).toList(),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarPoleOnGround,
          child: const ToolbarItem(
            child: Icon(
              Icons.poleOnGround,
              color: Colors.brown,
            ),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarPoleStanding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ToolbarItem(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.poleStandingBackground,
                        color: Colors.brightRed,
                      ),
                      Icon(Icons.poleStandingForeground),
                    ],
                  ),
                ),
              ),
              const ToolbarItem(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.poleStandingBackground,
                        color: Colors.orange,
                      ),
                      Icon(Icons.poleStandingForeground),
                    ],
                  ),
                ),
              ),
            ].intersperse(const SizedBox(width: 4)).toList(),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarMarker,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ToolbarItem(
                child: Icon(
                  Icons.marker,
                  color: Colors.yellow,
                ),
              ),
              const ToolbarItem(
                child: Icon(
                  Icons.marker,
                  color: Colors.brightRed,
                ),
              ),
              const ToolbarItem(
                child: Icon(
                  Icons.marker,
                  color: Colors.blue,
                ),
              ),
            ].intersperse(const SizedBox(width: 4)).toList(),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarCone,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ToolbarItem(
                child: Stack(
                  children: [
                    Icon(
                      Icons.coneBackground,
                      color: Colors.yellow,
                    ),
                    Icon(Icons.coneForeground),
                  ],
                ),
              ),
              const ToolbarItem(
                child: Stack(
                  children: [
                    Icon(
                      Icons.coneBackground,
                      color: Colors.brightRed,
                    ),
                    Icon(Icons.coneForeground),
                  ],
                ),
              ),
              const ToolbarItem(
                child: Stack(
                  children: [
                    Icon(
                      Icons.coneBackground,
                      color: Colors.blue,
                    ),
                    Icon(Icons.coneForeground),
                  ],
                ),
              ),
            ].intersperse(const SizedBox(width: 4)).toList(),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarFence,
          child: const ToolbarItem(
            child: Icon(Icons.fence),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarBench,
          child: const ToolbarItem(
            child: Icon(
              Icons.bench,
              color: Colors.brown,
            ),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarLadder,
          child: const ToolbarItem(
            child: Icon(Icons.ladder),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarSmallGoal,
          child: const ToolbarItem(
            child: Icon(Icons.smallGoal),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarLargeGoal,
          child: const ToolbarItem(
            child: Icon(Icons.largeGoal),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarFutsalGoal,
          child: const ToolbarItem(
            child: Icon(Icons.futsalGoal),
          ),
        ),
      ],
    );
  }
}
