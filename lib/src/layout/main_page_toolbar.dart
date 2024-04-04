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
                child: ToolbarIcon(
                  ToolbarIcons.offensivePlayer,
                  color: Colors.blue,
                ),
              ),
              const ToolbarItem(
                direction: Direction.forward,
                child: ToolbarIcon(
                  ToolbarIcons.offensivePlayer,
                  color: Colors.red,
                ),
              ),
              const ToolbarItem(
                direction: Direction.forward,
                child: ToolbarIcon(
                  ToolbarIcons.offensivePlayer,
                  color: Colors.yellow,
                ),
              ),
              const ToolbarItem(
                direction: Direction.forward,
                child: ToolbarIcon(
                  ToolbarIcons.offensivePlayer,
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
                child: ToolbarIcon(
                  ToolbarIcons.defensivePlayer,
                  color: Colors.blue,
                ),
              ),
              const ToolbarItem(
                direction: Direction.backward,
                child: ToolbarIcon(
                  ToolbarIcons.defensivePlayer,
                  color: Colors.red,
                ),
              ),
              const ToolbarItem(
                direction: Direction.backward,
                child: ToolbarIcon(
                  ToolbarIcons.defensivePlayer,
                  color: Colors.yellow,
                ),
              ),
              const ToolbarItem(
                direction: Direction.backward,
                child: ToolbarIcon(
                  ToolbarIcons.defensivePlayer,
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
            child: ToolbarIcon(ToolbarIcons.dummy),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarHoop,
          child: const ToolbarItem(
            child: ToolbarIcon(
              ToolbarIcons.hoop,
              color: Colors.yellow,
            ),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarPileOfBalls,
          child: const ToolbarItem(
            child: ToolbarIcon(ToolbarIcons.pileOfBalls),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarBall,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ToolbarItem(
                child: ToolbarIcon(
                  ToolbarIcons.ball,
                  color: Colors.lightGrey,
                ),
              ),
              const ToolbarItem(
                child: ToolbarIcon(
                  ToolbarIcons.ball,
                  color: Colors.yellow,
                ),
              ),
            ].intersperse(const SizedBox(width: 4)).toList(),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarPoleOnGround,
          child: const ToolbarItem(
            child: ToolbarIcon(
              ToolbarIcons.poleOnGround,
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
                  child: ToolbarIcon(
                    ToolbarIcons.poleStanding,
                    color: Colors.brightRed,
                  ),
                ),
              ),
              const ToolbarItem(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: ToolbarIcon(
                    ToolbarIcons.poleStanding,
                    color: Colors.orange,
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
                child: ToolbarIcon(
                  ToolbarIcons.marker,
                  color: Colors.yellow,
                ),
              ),
              const ToolbarItem(
                child: ToolbarIcon(
                  ToolbarIcons.marker,
                  color: Colors.brightRed,
                ),
              ),
              const ToolbarItem(
                child: ToolbarIcon(
                  ToolbarIcons.marker,
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
                child: ToolbarIcon(
                  ToolbarIcons.cone,
                  color: Colors.yellow,
                ),
              ),
              const ToolbarItem(
                child: ToolbarIcon(
                  ToolbarIcons.cone,
                  color: Colors.brightRed,
                ),
              ),
              const ToolbarItem(
                child: ToolbarIcon(
                  ToolbarIcons.cone,
                  color: Colors.blue,
                ),
              ),
            ].intersperse(const SizedBox(width: 4)).toList(),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarFence,
          child: const ToolbarItem(
            child: ToolbarIcon(ToolbarIcons.fence),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarBench,
          child: const ToolbarItem(
            child: ToolbarIcon(
              ToolbarIcons.bench,
              color: Colors.brown,
            ),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarLadder,
          child: const ToolbarItem(
            child: ToolbarIcon(ToolbarIcons.ladder),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarSmallGoal,
          child: const ToolbarItem(
            child: ToolbarIcon(ToolbarIcons.smallGoal),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarLargeGoal,
          child: const ToolbarItem(
            child: ToolbarIcon(ToolbarIcons.largeGoal),
          ),
        ),
        ToolbarGroup(
          title: l10n.toolbarFutsalGoal,
          child: const ToolbarItem(
            child: ToolbarIcon(ToolbarIcons.futsalGoal),
          ),
        ),
      ],
    );
  }
}
