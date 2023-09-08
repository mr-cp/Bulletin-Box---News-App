import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    print('drawer working');
    final themeState = Provider.of<DarkThemeProvider>(context);
    
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Image.asset(
                    'assets/imgHeader.png',
                  ),
                ),
                Column(children: [
                  Text(
                    'Bulletin Box',
                    style: GoogleFonts.orbitron(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 35,
                          letterSpacing: 1),
                    ),
                  ),
                  // const SizedBox(height: 5),
                  const Text(
                    'Explore the Newsiverse',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                       letterSpacing: 3.5,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ])
              ]),
            ),
            const SizedBox(height: 15),
            ListTilesWidget(
              label: 'Home',
              func: () {},
              icon: Icons.home,
            ),
            ListTilesWidget(
              label: 'Bookmark',
              func: () {},
              icon: Icons.bookmark,
            ),
            const Divider(),
            SwitchListTile(
              value: themeState.getDarkTheme,
              title: const Text('Theme',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) {
                print('2 is printing');

                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// List Tiles:
class ListTilesWidget extends StatelessWidget {
  const ListTilesWidget({
    super.key,
    required this.label,
    required this.func,
    required this.icon,
  });

  final String label;
  final Function func;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
      leading: Icon(icon),
      onTap: () {
        func();
      },
    );
  }
}
