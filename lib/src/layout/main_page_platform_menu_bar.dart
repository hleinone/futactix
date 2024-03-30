import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class MainPagePlatformMenuBar extends StatelessWidget {
  final Widget? child;
  final void Function(MenuItem) onSelected;

  const MainPagePlatformMenuBar({super.key, this.child, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
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
                    onSelected(MenuItem.about);
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarSettings,
                  onSelected: () {
                    onSelected(MenuItem.settings);
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
                onSelected(MenuItem.quit);
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
                    onSelected(MenuItem.newProject);
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyN,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarOpen,
                  onSelected: () {
                    onSelected(MenuItem.open);
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyO,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarSave,
                  onSelected: () {
                    onSelected(MenuItem.save);
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
                    onSelected(MenuItem.undo);
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyZ,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarClear,
                  onSelected: () {
                    onSelected(MenuItem.clear);
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarRemoveObjects,
                  onSelected: () {
                    onSelected(MenuItem.removeObjects);
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
                    onSelected(MenuItem.football5);
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball8,
                  onSelected: () {
                    onSelected(MenuItem.football8);
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball11,
                  onSelected: () {
                    onSelected(MenuItem.football11);
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarFootball5vs5,
                  onSelected: () {
                    onSelected(MenuItem.football5vs5);
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball8vs8,
                  onSelected: () {
                    onSelected(MenuItem.football8vs8);
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball11vs11,
                  onSelected: () {
                    onSelected(MenuItem.football11vs11);
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarFutsal5,
                  onSelected: () {
                    onSelected(MenuItem.futsal5);
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFutsal5vs5,
                  onSelected: () {
                    onSelected(MenuItem.futsal5vs5);
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

enum MenuItem {
  about,
  settings,
  quit,
  newProject,
  open,
  save,
  undo,
  clear,
  removeObjects,
  football5,
  football8,
  football11,
  football5vs5,
  football8vs8,
  football11vs11,
  futsal5,
  futsal5vs5,
}
